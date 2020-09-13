
//class Exception {
//    var message:Any
//    init(message: Any){
//        self.message = message
//    }
//}

// MARK: A Krypton Exeption.

class KryptonExeption{
    var message: String
    init(message: String){
        self.message = message
    }
    
    func toString() -> String {
        return message
    }
}

// MARK: Email aready exists in the database.
class EmailAlreadyExistException: KryptonExeption {
    override init(message: String) {
        super.init(message: message)
    }
}

// MARK: Account recorery email too old.
class WrongPasswordException: KryptonExeption{
    override init(message: String) {
        super.init(message: message)
    }
}

// MARK: Email could not be sent.
class UpdatePassWordTooLateExeption: KryptonExeption {
    override init(message: String) {
        super.init(message: message)
    }
}

// MARK: Account recorery email too old.
class EmailNotSendException: KryptonExeption {
    override init(message: String) {
        super.init(message: message)
    }
}

// MARK: User not found.
class UserNotFoundException: KryptonExeption {
    override init(message: String) {
        super.init(message: message)
    }
}

// MARK: Request not authorized.
class UnauthorizedExeption: KryptonExeption{
    override init(message: String) {
        super.init(message: message)
    }
}

// MARK: User token Encryption failed.
class TokenEncryptionException: KryptonExeption {
    override init(message: String) {
        super.init(message: message)
    }
}

// MARK: Email already confirmed.
class EmailAlreadyConfirmedExeption: KryptonExeption{
    override init(message: String) {
        super.init(message: message)
    }
}

// MARK: User updates do not pass the fields validator.
class UserValidationException: KryptonExeption {
    override init(message: String) {
        super.init(message: message)
    }
}

// MARK: User already logged in.
class AlreadyLoggedInException: KryptonExeption {
    override init(message: String) {
        super.init(message: message)
    }
}

// MARK: Encryption failed.
class EncryptionFailException: KryptonExeption {
    override init(message: String) {
        super.init(message: message)
    }
}
