import FirebaseFirestoreSwift
import Foundation

class Data: Identifiable, Codable, ObservableObject{
    
    @DocumentID var id: String?

    var mal_id: Int = 0
    var title: String = "No title"
    var status: String = "No Partner"
    var rating: String = "X"
    var score: Double = 8.5
    var synopsis: String = "cool anime"
    var genres = [Genres]()
    var images: String = "img.com"
    
    var my_score: Double?
    var my_comment: String?
    
    init(){

    }

    init(mal_id:Int, title: String, status: String, rating: String, score: Double, synopsis: String, genres: [Genres], images: String, my_score: Double, my_comment: String){
        self.mal_id = mal_id
        self.title = title
        self.status = status
        self.rating = rating
        self.score = score
        self.synopsis = synopsis
        self.genres = genres
        self.images = images
        self.my_score = my_score
        self.my_comment = my_comment
    }
    
    init(mal_id:Int, title: String, status: String, rating: String, score: Double, synopsis: String, genres: [Genres], images: String){
        self.mal_id = mal_id
        self.title = title
        self.status = status
        self.rating = rating
        self.score = score
        self.synopsis = synopsis
        self.genres = genres
        self.images = images
    }
}
