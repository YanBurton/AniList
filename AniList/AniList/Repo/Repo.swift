import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class Repo: ObservableObject {

    static var shared = Repo()

    @Published var list: [Data] = []

    private let path = "AnimeList"
    private let store = Firestore.firestore()

    init() {
        get()
    }


    func get() {
        store.collection(path).addSnapshotListener { snapshot, error in

            if let error = error {
                print(error)
                return
            }

            self.list = snapshot?.documents.compactMap {
                try? $0.data(as: Data.self)
            } ?? []
        }
    }


    func add(todo: Data){
        do {
            try store.collection(path).addDocument(from: todo)
        } catch {
            print(error)
        }
    }


    func delete(docId: String){
        //print("called")
        store.collection(path).document(docId).delete() { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }


    func update(todo:Data, docId: String){
        store.collection(path).document(docId).setData(["mal_id": todo.mal_id, "images": todo.images, "synopsis": todo.synopsis, "status": todo.status, "rating": todo.rating, "title": todo.title, "my_comment": todo.my_comment, "my_score": todo.my_score, "genres": todo.genres, "score": todo.score])
    }


}

