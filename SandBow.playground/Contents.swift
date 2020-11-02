import Foundation
struct Article {
    let prix: Float
}

struct PorteMonnaie {
    let montantDispo: Float
}

enum ErreurDePaiement: Error {
    case fondsInsuffisants
    case prixIncorrect
}

func acheter(_ article: Article, paiement: PorteMonnaie) throws -> PorteMonnaie {
    guard article.prix >= 0.0 else {
        throw ErreurDePaiement.prixIncorrect
    }
    let reste = paiement.montantDispo - article.prix
    
    guard reste >= 0.0 else {
        throw ErreurDePaiement.fondsInsuffisants
    }
    
    return PorteMonnaie(montantDispo: reste)
}

var monPorteMonnaie = PorteMonnaie(montantDispo: 10.0)

var baguette = Article(prix: 1.00)
var ecranGean = Article(prix: 899.99)
var anomalie = Article(prix: -23.0)

//monPorteMonnaie = try acheter(baguette, paiement: monPorteMonnaie)
//monPorteMonnaie = try acheter(ecranGean, paiement: monPorteMonnaie)
//monPorteMonnaie = try acheter(anomalie, paiement: monPorteMonnaie)





DispatchQueue.global(qos: .background).sync {
    print("Début bloc appelant")
    DispatchQueue.global(qos: .background).sync {
        print("Débt bloc file")
        sleep(2)
        print("Fin du bloc")
    }
    print("fin bloc appelant")
}



enum fail{
    case test
}
var cookies:[Any] = []


func setRefreshToken(refreshToken: String) throws -> [Any?]{
    guard let cookie:[Any] = cookies else{
        throw ErreurDePaiement.prixIncorrect
    }
    return cookie
}

print(try setRefreshToken(refreshToken: ""))
