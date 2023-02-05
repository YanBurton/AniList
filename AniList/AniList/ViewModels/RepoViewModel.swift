import Combine
class RepoViewModel: ObservableObject {

    @Published var toDoList = [Data]()
    @Published var toDoRepository = Repo.shared
    //@Published var toBeUpdatedToDo = Data()
    //@Published var documentId: String = ""

    private var cancellables: Set<AnyCancellable> = []

    init(){
        self.toDoRepository.$list // accesses publisher that gives us an array of todos
            .assign(to: \.toDoList, on: self) // subscribes to the publisher
            .store(in: &cancellables) // stores it in the Set of Cancellables
    }


    func addToDo(todo: Data){
        self.toDoRepository.add(todo: todo)
    }

    func deleteToDo(docId: String){
        self.toDoRepository.delete(docId: docId)
    }
    func updateToDo(docId: String, todo: Data){
        self.toDoRepository.update(todo: todo, docId: docId)
        //print(toDoList)
    }
}
