
import UIKit
import UserNotifications

class ViewController: UIViewController , UNUserNotificationCenterDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (aceito, erro) in
            if !aceito {
                print("Acesso a notificações negado pelo usuário")
            }
        }
        UNUserNotificationCenter.current().delegate = self

    }

    @IBAction func notificar(_ sender: UIButton) {
        //Gatinho de escolha da data
        let gatilho = UNTimeIntervalNotificationTrigger(timeInterval: 10.0, repeats: false)
        
        //Conteudo da notificacao
        let conteudo = UNMutableNotificationContent()
        conteudo.title = "Lembrete"
        conteudo.body = "Este lembrete foi solicitado a 10 segundos atrás"
        conteudo.sound = UNNotificationSound.default()

        
        
        //Requisiçao de apresentacao da notificacao
        let requisicao = UNNotificationRequest(identifier: "textoNotificacao", content: conteudo, trigger: gatilho)
        
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests() //Remove as notificacoes anteriores
        
        UNUserNotificationCenter.current().add(requisicao, withCompletionHandler: nil)
    }


}


