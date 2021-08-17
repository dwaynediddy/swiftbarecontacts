//
//  Contact.swift
//  app
//
//  Created by Dwayne on 17/8/21.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}

//
//struct Contact: Codable {
//    var email: String
//    var first_name: String
//    var last_name: String
//    var avatar: String
//}
////
////{"page":1,"per_page":6,"total":12,"total_pages":2,"data":[{"id":1,"email":"george.bluth@reqres.in","first_name":"George","last_name":"Bluth","avatar":"https://reqres.in/img/faces/1-image.jpg"},{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},{"id":3,"email":"emma.wong@reqres.in","first_name":"Emma","last_name":"Wong","avatar":"https://reqres.in/img/faces/3-image.jpg"},{"id":4,"email":"eve.holt@reqres.in","first_name":"Eve","last_name":"Holt","avatar":"https://reqres.in/img/faces/4-image.jpg"},{"id":5,"email":"charles.morris@reqres.in","first_name":"Charles","last_name":"Morris","avatar":"https://reqres.in/img/faces/5-image.jpg"},{"id":6,"email":"tracey.ramos@reqres.in","first_name":"Tracey","last_name":"Ramos","avatar":"https://reqres.in/img/faces/6-image.jpg"}]
//
//let hardCodeContacts:[[String]] = [
//    ["Elon Musk",       "+1-201-3141-5926"],
//    ["Bill Gates",      "+1-202-5358-9793"],
//    ["Tim Cook",        "+1-203-2384-6264"],
//    ["Richard Branson", "+1-204-3383-2795"],
//    ["Jeff Bezos",      "+1-205-0288-4197"],
//    ["Warren Buffet",   "+1-206-1693-9937"],
//    ["The Zuck",        "+1-207-5105-8209"],
//    ["Carlos Slim",     "+1-208-7494-4592"],
//    ["Bill Gates",      "+1-209-3078-1640"],
//    ["Larry Page",      "+1-210-6286-2089"],
//    ["Harold Finch",    "+1-211-9862-8034"],
//    ["Sergey Brin",     "+1-212-8253-4211"],
//    ["Jack Ma",         "+1-213-7067-9821"],
//    ["Steve Ballmer",   "+1-214-4808-6513"],
//    ["Phil Knight",     "+1-215-2823-0664"],
//    ["Paul Allen",      "+1-216-7093-8446"],
//    ["Woz",             "+1-217-0955-0582"]
//]


