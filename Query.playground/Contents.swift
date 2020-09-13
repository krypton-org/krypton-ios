//
//  Query.swift
//  krypton-ios
//
//  Created by Guillaume Verpoest on 03/09/2020.
//  Copyright © 2020 Guillaume Verpoest. All rights reserved.
//

import UIKit


// MARK: Query
class Query{
    var _variables: Dictionary<String, Any>
    
    init(variables: Dictionary<String, Any>) {
        self._variables = variables
    }
    
    func toJson() -> Dictionary<String, Any>{
        return ["query": _getQuery(), "variable": _variables]
    }
    
    func _getQuery() -> String{
        return ""
    }
    
}


// MARK: QueryWithRequestFields
class QueryWithRequestFields: Query{
    var _requestedFields: Array<String>
    
    init(variables: Dictionary<String, Any>, requestedFields: Array<String>){
        self._requestedFields = requestedFields
        super.init(variables: variables)
        
    }
    func _getRequestedFieldsFragment() -> String{
        return """
            fragment requestedFields on UserPublicInfo {
        \(self._requestedFields.joined(separator: " "))
            }
        """
    }
    override func toJson() -> Dictionary<String, Any> {
        return
            [ "query": _getQuery() + " " + _getRequestedFieldsFragment(),
              "variables": _variables]
        
    }
}
// MARK: RefreshQuery

class RefreshQuery: Query {
    init(){
        super.init(variables: [:])
    }
    override func _getQuery() -> String {
        return """
                mutation { refreshToken { token, expiryDate } }
            """
    }
}

// MARK: RegisterQuery

class RegisterQuery: Query {
    override init(variables: Dictionary<String, Any>){
        super.init(variables: variables)
    }
    override func _getQuery() -> String {
        return """
        mutation register($fields: UserRegisterInput!) {
                register(fields: $fields)
            }
        """
    }
    
}
// MARK: LoginQuery

class LoginQuery: Query{
     override init(variables: Dictionary<String, Any>){
           super.init(variables: variables)
       }
    
    override func _getQuery() -> String {
        return """
            mutation login($email: String!, $password: String!) {
                login(email: $email, password: $password) {
                    token
                    expiryDate
                }
            }
        """
    }
}

// MARK: LougoutQuery
class LogoutQuery: Query{
    init(){
        let _variables = ["":""]
        super.init(variables: _variables)
    }
    
    override func _getQuery() -> String {
        """
            mutation{
              logout
            }
        """
    }
}

// MARK: UpdateQuery
class UpdateQuery: Query{
     override init(variables: Dictionary<String, Any>){
           super.init(variables: variables)
       }
    
    override func _getQuery() -> String {
       return """
            mutation updateMe($fields: UserUpdateInput!) {
                updateMe(fields: $fields) {
                    token
                    expiryDate
                }
            }
        """
    }
}

// MARK: DeleteQuery
class DeleteQuery: Query{
     override init(variables: Dictionary<String, Any>){
           super.init(variables: variables)
       }
    
    override func _getQuery() -> String {
        return """
            mutation deleteMe($password: String!) {
                deleteMe(password: $password)
            }
        """
    }
}

// MARK: EmailAvailableQuery
class EmailAvaibleQuery: Query{
    override init(variables: Dictionary<String, Any>){
           super.init(variables: variables)
       }
    
    override func _getQuery() -> String {
        return """
            query {
              sendVerificationEmail
            }
        """
    }
}

// MARK: SendVerificationEmailQuery

class SendVerifcationEmailQuery: Query{
     init(){
         let _variables = ["":""]
         super.init(variables: _variables)
     }
    
    override func _getQuery() -> String {
        return """
            query {
                sendVerificationEmail
            }
        """
    }
}

// MARK: PublicKeyQuery
class PublicKeyQuery: Query{
    init(){
        let _variables = ["":""]
        super.init(variables: _variables)
    }
    
    override func _getQuery() -> String {
        return """
            query {
                publicKey
            }
        """
    }
}

// MARK: SendPasswordRecoveryQuery
class SendPasswordRecoveryQuery: Query{
    init(){
        let _variables = ["":""]
        super.init(variables: _variables)
    }
    
    override func _getQuery() -> String {
        return """
            query sendPasswordRecoveryEmail($email: String!) {
                sendPasswordRecoveryEmail(email: $email)
            }
        """
    }
}

// MARK: UserOneQuery
class UserOneQuery : QueryWithRequestFields{
    override init(variables: Dictionary<String, Any>, requestedFields: Array<String>){
        super.init(variables: variables, requestedFields: requestedFields)
       }
    
    override func _getQuery() -> String {
        return """
            query userOne($filter: FilterFindOneUserPublicInfoInput!) {
                       userOne(filter: $filter){
                           ...requestedFields
            }
        """
    }
}

// MARK: UserByIdQuery
class UserByIdQuery: QueryWithRequestFields{
    override init(variables: Dictionary<String, Any>, requestedFields: Array<String>){
     super.init(variables: variables, requestedFields: requestedFields)
    }
    override func _getQuery() -> String {
        return """
            query userByIds($ids: [MongoID]!) {
                userByIds(_ids: $ids){
                    ...requestedFields
                }
            }
        """
    }
}
// MARK: UserManyQuery
class UserManyQuery: QueryWithRequestFields{
    override init(variables: Dictionary<String, Any>, requestedFields: Array<String>){
     super.init(variables: variables, requestedFields: requestedFields)
    }
    
    override func _getQuery() -> String {
        return """
            query userMany($filter: FilterFindManyUserPublicInfoInput!, $limit: Int) {
                userMany(filter: $filter, limit: $limit){
                    ...requestedFields
                }
            }
        """
    }
}

// MARK: UserCountQuery
class UserCountQuery: Query{
    override init(variables : Dictionary<String, Any>){
        super.init(variables: variables)
    }
    
    override func _getQuery() -> String {
        if (_variables["filter"] != nil) {
            return """
                query userCount($filter: FilterUserPublicInfoInput!) {
                                   userCount(filter: $filter)
                }
            """
        }else {
            return"""
                    query {
                        userCount
                    }
            """
        }
    }
}
// MARK: UserPaginationQuery
class UserPaginationQuery: QueryWithRequestFields{
    override init(variables: Dictionary<String, Any>, requestedFields: Array<String>) {
        super.init(variables: variables, requestedFields: requestedFields)
    }
    
    override func _getQuery() -> String {
        return """
            query userPagination($filter: FilterFindManyUserPublicInfoInput!, $page: Int!, $perPage: Int!) {
                userPagination(filter: $filter, page: $page, perPage: $perPage){
                    ...requestedFields
                }
            }
        """
    }
    override func _getRequestedFieldsFragment() -> String{
        return """
            fragment requestedFields on UserPublicInfoPagination {
                            items{
                                ${_requestedFields.join(" ")}
                            }
                            pageInfo{
                                currentPage
                                perPage
                                pageCount
                                itemCount
                                hasNextPage
                                hasPreviousPage
                            }
                        }
        """
    }
}


