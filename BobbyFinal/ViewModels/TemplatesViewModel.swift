//
//  TemplatesViewModel.swift
//  BobbyFinal
//
//  Created by artemiithefrog . on 25.09.2023.
//

import SwiftUI

class TemplatesViewModel {
    
    var popularTemplates: [Templates] =
    [
        Templates(icon: "facebook", name: "Amazon AWS", color: Color(hex: "#FF9900")),
        Templates(icon: "discord", name: "American Express", color: Color(hex: "#002663")),
        Templates(icon: "apple", name: "Apple Music", color: Color(hex: "#000000")),
        Templates(icon: "github", name: "AT&T", color: Color(hex: "#FF7201")),
        Templates(icon: "google", name: "Bank of America", color: Color(hex: "#194F90")),
        Templates(icon: "instagram", name: "Basecamp", color: Color(hex: "#6FC267")),
        Templates(icon: "creativeCloud", name: "Creative Cloud", color: Color(hex: "#D61304")),
        Templates(icon: "spotify", name: "Deezer", color: Color(hex: "#010000")),
        Templates(icon: "telegram", name: "Dribble", color: Color(hex: "#EA4C89")),
        Templates(icon: "tik-tok", name: "Dropbox", color: Color(hex: "#0161FE")),
        Templates(icon: "twitter", name: "Evernote", color: Color(hex: "#7AC142")),
        Templates(icon: "whatsapp", name: "Google Domains", color: Color(hex: "#4285F4")),
        Templates(icon: "youtube", name: "Google Drive", color: Color(hex: "#1DA463"))
    ]
    
    var allTemplates: [Templates] =
    [
//        Templates(icon: Image(systemName: "icloud.circle"), name: "1&1 IONOS", color: Color(hex: "#0000FF")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "123 Reg", color: Color(hex: "#0093D1")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "1Blocker", color: Color(hex: "#000000")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "1Password", color: Color(hex: "#198CFF")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "24-Hours Fitness", color: Color(hex: "#DB4134")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "500PX", color: Color(hex: "#0097E8")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "Aaptiv", color: Color(hex: "#1B19FF")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "Aargauische Kantonalbank", color: Color(hex: "#019EE0")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "ABN Amro", color: Color(hex: "#009286")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "AdGuard", color: Color(hex: "#67B279")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "Admiral", color: Color(hex: "#0045A0")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "Adobe XD", color: Color(hex: "#EB45BD")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "Aegon", color: Color(hex: "#3395D3")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "Affinity Water", color: Color(hex: "#009BD9")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "AirTel", color: Color(hex: "#F34C12")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "AirVPN", color: Color(hex: "#3B79E2")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "Albert Heijn", color: Color(hex: "#189EDA")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "Algemeen Dagblad", color: Color(hex: "#D10018")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "Alinma Bank", color: Color(hex: "#522D24")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "Allinaz", color: Color(hex: "#004A93")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "AI Rajhi Bank", color: Color(hex: "#390065")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "Amazon", color: Color(hex: "#FF9A01")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "Amazon AWS", color: Color(hex: "#FF9900")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "Amazon Prime", color: Color(hex: "#FF9A01")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "Ambrogio Robot Connect", color: Color(hex: "#507A27")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "AMC A-List", color: Color(hex: "#E32400")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "American Express", color: Color(hex: "#002663")),
//        Templates(icon: Image(systemName: "icloud.circle"), name: "AMI Insurance", color: Color(hex: "#FEC700"))
        
        Templates(icon: "apple", name: "Amazon AWS", color: Color(hex: "#FF9900") ),
        Templates(icon: "discord", name: "American Express", color: Color(hex: "#002663")),
        Templates(icon: "facebook", name: "Apple Music", color: Color(hex: "#000000")),
        Templates(icon: "github", name: "AT&T", color: Color(hex: "#FF7201")),
        Templates(icon: "google", name: "Bank of America", color: Color(hex: "#194F90")),
        Templates(icon: "instagram", name: "Basecamp", color: Color(hex: "#6FC267")),
        Templates(icon: "linkedin", name: "Creative Cloud", color: Color(hex: "#D61304")),
        Templates(icon: "spotify", name: "Deezer", color: Color(hex: "#010000")),
        Templates(icon: "telegram", name: "Dribble", color: Color(hex: "#EA4C89")),
        Templates(icon: "tik-tok", name: "Dropbox", color: Color(hex: "#0161FE")),
        Templates(icon: "twitter", name: "Evernote", color: Color(hex: "#7AC142")),
        Templates(icon: "whatsapp", name: "Google Domains", color: Color(hex: "#4285F4")),
        Templates(icon: "youtube", name: "Google Drive", color: Color(hex: "#1DA463"))
    ]
    
    @Published var selectedTemplate: Templates?
}
