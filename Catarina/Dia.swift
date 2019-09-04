import Foundation

class Dia{
    
    
    var listaPeriodo:[Periodo]
    var data:String!
    
    
    
//    init(listaPeriodo: [Periodo]) {
//        self.listaPeriodo = listaPeriodo
//    }
    
    init(listaPeriodo: [Periodo],nDate:String) {
        self.listaPeriodo = listaPeriodo
        self.data = nDate
    }
    
//    func getDiaNumero()-> String{
//        let date = Date()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd"
//        return dateFormatter.string(from: date)
//    }
//    func getMesNumero()-> String{
//        let date = Date()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "mm"
//        return dateFormatter.string(from: date)
//    }
//    func getAnoNumero()-> String{
//        let date = Date()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy"
//        return dateFormatter.string(from: date)
//    }
//    func getAllData()-> String{
//        let date = Date()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd/MM/yyyy"
//        return dateFormatter.string(from: date)
//    }
    
    
   

    
}
