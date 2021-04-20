//
//  Email.swift
//  PlaygroundSources
//
//  Created by Jack Zhao on 4/17/21.
//

import Foundation

struct Email: Identifiable {
    let id = UUID()
    var sender: String = ""
    var recipient: String = ""
    var time: String = ""
    var subject: String = ""
    var content: String = ""
    var preview: String = ""
    var attachmentName: String = ""
}

extension Email {
    static let allEmails = [
        Email(sender: "customerservice@deliver.com", recipient: "jerry273@malwaretech.com", time: "2021-04-12", subject: "Your order has arrived!", content: "Dear customer,\n\nYour recent order 037264827482 has been delivered.\n\n\tDelivery summary:\n\tOrder delivered.\t\tApr 12, 8:35AM\n\tOrder picked up.\t\tApr 12, 6:47AM\n\tOrder is in transit.\t\tApr 11, 5:03AM\n\tOrder received.\t\tApr 10, 3:58PM\n\n\nIf you have any question regarding this order, please email our customer service at customer@deliver.com\n\nSincerely,\n\nThe Deliver™ Inc.", preview: "Dear customer, Your recent order 037264827482 has been delivered. Delivery summary: "),
        
        Email(sender: "jimmy.woo@fbi.com", recipient: "jerry273@malwaretech.com", time: "2021-04-03", subject: "Case Detail", content: "Jerry, \n\nAs I mentioned earlier, this time the Site 087 is way more active than before. I have attached the historical data of Site 087 (id: 706087) from our research team below, wish that could be helpful. But don't expect too much.\n\np.s. If you need to learn more, access the file from the Digital Archive. You have that installed on your phone, right?\n\nGood luck,\nJimmy", preview: "Test content, there is nothing here to ses",  attachmentName: "706087-data.pdf"),
        Email(sender: "no-reply@specture.com", recipient: "jerry273@malwaretech.com", time: "2021-03-31", subject: "Limited Time Offer!", content: "Dear Specture Customer,\n\nWant to Go Faster? Upgrade Your Internet Plan right now!\n\nUnlock speeds up to 940 Mbps with an upgraded Internet plan from specture (wireless speeds may vary). Learn more about our fast and affordable Internet plans.\n\nLearn more at our website.\n\nBest,\n\nspecture Inc.", preview: "Dear Specturum Customer,\n\nWant to Go Faster? Upgrade Your Internet Plan right now!",  attachmentName: ""),
        
    ]
}
