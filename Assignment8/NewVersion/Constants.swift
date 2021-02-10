//
//  Constants.swift
//  Assignment8
//
//  Created by Adriano Gaiotto de Oliveira on 2021-02-09.
//

import Foundation

enum TypeFood : String, Comparable, CaseIterable {
    
    case Mexican
    case Japanese
    case American
    case Brazilian
    case BBQ
    case Italian
    case FastFood = "Fast Food"
    case Mediterranean
    case OldSchool = "Old School"
    
    var labelPortuguese: String {
        switch self {
        case .Mexican:
            return "Mexicano"
        case .Japanese:
            return "Japonês"
        case .American:
            return "Americano"
        case .Brazilian:
            return "Brasileiro"
        case .BBQ:
            return "Churrasco"
        case .Italian:
            return "Italiano"
        case .FastFood:
            return "Fast Food"
        case .Mediterranean:
            return "Mediterrâneo"
        case .OldSchool:
            return "Old School"
        }
    }
    
    static func < (lhs: TypeFood, rhs: TypeFood) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    
}

enum MealTime : String, Comparable, CaseIterable {
    
    case Breakfast
    case Lunch
    case Dinner
    
    var labelPortuguese: String {
        switch self {
        case .Breakfast:
            return "Café da Manhã"
        case .Lunch:
            return "Almoço"
        case .Dinner:
            return "Jantar"
        }
    }
    
    static func < (lhs: MealTime, rhs: MealTime) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}


enum Language {
    case English
    case Portugueses
}


enum descRestaurant : String {
    
    case RioBrazilianSteakhouse = "At Rio Brazilian Steakhouse you’ll experience “CHURRASCO”, the authentic and unique Brazilian barbeque, a Meat Heaven!\n\nOur all you can eat concept offers a continuous service with an extraordinary variety of meats including, beef, pork, lamb, chicken, ribs, etc.; along with a fresh and modern unlimited choices of hot sides and salads a Gluten Free Paradise, with daily chef creations for your pleasure. We are the perfect choice for your diet, KETO AND ATKINS friendly"
    case TheOldSpaghettiFactory = "The Old Spaghetti Factory is an Italian-style chain restaurant in the United States and Canada. The U.S. restaurants are owned by OSF International, based in Portland, Oregon, while the Canadian restaurants are owned by The Old Spaghetti Factory Canada Ltd. In 2003, the U.S. company alone had 45 restaurants, in 14 states and Japan"
    case FiveGuys = "Five Guys Enterprises LLC is an American fast casual restaurant chain focused on hamburgers , hot dogs , and fries , and is based in Lorton, Virginia , an unincorporated part of Fairfax County. The first Five Guys restaurant opened in 1986 in Arlington County, Virginia , and in 2001, the chain expanded to five locations throughout the Washington, DC metropolitan area."
    case RedRobin = "Red Robin Gourmet Burgers and Brews, or simply Red Robin, is an American chain of casual dining restaurants founded in September 1969 in Seattle, Washington. In 1979, the first franchised Red Robin restaurant was opened in Yakima, Washington. Red Robin's headquarters are in Greenwood Village, Colorado. As of August 2020, the company had over 570 restaurants in operation with 90 being operated as a franchise."
    case RamenGojiro = "At Ramen Gojiro, we specialize in jiro-style, also known as gatsuri-style, ramen. This style of ramen boasts voluminous amounts of noodles and toppings and is wildly popular in Japan. The over-the-top bowls that we offer at Ramen Gojiro will ensure that your ramen cravings are satisfied.\n\nRamen Gojiro is a part of the parent company, Menya Kouji Group. The Menya Kouji Group is proud to continually introduce different styles of ramen that are currently popular in Japan to the rest of the world. We hope you come by for a bowl of Gojiro Ramen."
    case CafeMedina = "Since opening in 2008, Café Medina is a purveyor of fine Mediterranean-inspired cuisine, who has carved out a niche as a truly exceptional breakfast, lunch and weekend-brunch destination that effortlessly blends eclectic bistro fare, connoisseur-savvy coffee and sweet nourishment via the city’s best Belgian waffles."
    case TheTempleton = "The Templeton – nostalgic and delicious food served up in the heart of Vancouver’s entertainment district on Granville Row. It’s the plate full of goodness that your mom used to make – or you wished she did!\n\nPlug a quarter in the jukebox and enjoy breakfast made with free range eggs and natural bacon. Or come in for dinner and dig into a gourmet burger and an authentic milkshake."
    case Chipotle = "Chipotle Mexican Grill, often known simply as Chipotle, is an American chain of fast casual restaurants in the United States, United Kingdom, Canada, Germany, and France, specializing in tacos and Mission burritos that are made to order in front of the customer. Its name derives from chipotle, the Nahuatl name for a smoked and dried jalapeño chili pepper."
    case GyuKaku = "There are over 700 Gyu-Kaku restaurants worldwide, and the first U.S. location opened in West Los Angeles in 2001. Our Award Winning Restaurant was awarded the Hot Concept Award in 2007 and the demand keeps growing! Our fun and exciting experience allows for everyone to enjoy barbecuing at their table. The best part? Our Smokeless Roaster. With our down draft system, the smoke is sucked into the bottom of the table and away from guests!"
    case LaCantinaTacos = "Authentic Mexican Street Food with the freshest ingredients in our tacos, burritos & salads. Casual, fun atmosphere with Margaritas & Beer. Great Value!"
    
    
    var descPortuguese : String {
        switch self {
        case .RioBrazilianSteakhouse:
            return "No Rio Brazilian Steakhouse você vai experimentar o “CHURRASCO”, o autêntico e único churrasco brasileiro, um Paraíso da Carne!\n\nNosso conceito de tudo que puder comer oferece um serviço contínuo com uma variedade extraordinária de carnes, incluindo bovina, suína, cordeiro, frango, costela, etc. junto com opções ilimitadas de acompanhamentos quentes e saladas frescas e modernas, um Paraíso Sem Glúten, com criações diarias do chef para seu prazer. Nós somos a escolha perfeita para sua dieta, KETO E ATKINS amigáveis"
        case .TheOldSpaghettiFactory:
            return "The Old Spaghetti Factory é uma rede de restaurantes de estilo italiano nos Estados Unidos e Canadá. Os restaurantes dos EUA são de propriedade da OSF International, com sede em Portland, Oregon, enquanto os restaurantes canadenses são propriedade da The Old Spaghetti Factory Canada Ltd. Em 2003, a empresa dos EUA sozinha tinha 45 restaurantes, em 14 estados e no Japão"
        case .FiveGuys:
            return "Five Guys Enterprises LLC é uma rede americana de restaurantes fast casual com foco em hambúrgueres, cachorros-quentes e batatas fritas, e tem sede em Lorton, Virginia, uma parte não incorporada do Condado de Fairfax. O primeiro restaurante Five Guys foi inaugurado em 1986 no condado de Arlington, Virgínia, e em 2001, a rede se expandiu para cinco locais em toda a área metropolitana de Washington, DC."
        case .RedRobin:
            return "Red Robin Gourmet Burgers and Brews, ou simplesmente Red Robin, é uma rede americana de restaurantes casuais fundada em setembro de 1969 em Seattle, Washington. Em 1979, o primeiro restaurante franqueado Red Robin foi inaugurado em Yakima, Washington. A sede da Red Robin fica em Greenwood Village, Colorado. Em agosto de 2020, a empresa tinha mais de 570 restaurantes em operação, sendo 90 operados como franquia."
        case .RamenGojiro:
            return "Na Ramen Gojiro, nos especializamos no estilo jiro, também conhecido como estilo gatsuri, ramen. Este estilo de ramen apresenta grandes quantidades de macarrão e coberturas e é muito popular no Japão. As tigelas acima do topo que oferecemos no Ramen Gojiro irão garantir que seus desejos sejam satisfeitos.\n\nRamen Gojiro faz parte da empresa controladora, Menya Kouji Group. O Grupo Menya Kouji tem o orgulho de apresentar continuamente diferentes estilos de ramen que são populares atualmente no Japão para o resto do mundo. Esperamos que você venha para uma tigela de Gojiro Ramen."
        case .CafeMedina:
            return "Desde a sua inauguração em 2008, o Café Medina é um fornecedor de requintada cozinha de inspiração mediterrânea, que conquistou um nicho como um destino verdadeiramente excepcional para café da manhã, almoço e brunch de fim de semana que combina sem esforço pratos ecléticos de bistrô, café conhecedor e alimentos doces via os melhores waffles belgas da cidade."
        case .TheTempleton:
            return "The Templeton - comida nostálgica e deliciosa servida no coração do distrito de entretenimento de Vancouver, na Rua Granville. É o prato cheio de bondade que sua mãe costumava fazer - ou você gostaria que ela fizesse!\n\nConecte uma moeda na jukebox e desfrute do café da manhã feito com ovos caipiras e bacon natural. Ou venha jantar e experimente um hambúrguer gourmet e um autêntico milkshake."
        case .Chipotle:
            return "Chipotle Mexican Grill, também conhecido simplesmente como Chipotle, é uma rede americana de restaurantes fast casual nos Estados Unidos, Reino Unido, Canadá, Alemanha e França, especializada em tacos e burritos Mission que são feitos sob encomenda na frente do cliente. Seu nome deriva de chipotle, o nome nahuatl para uma pimenta jalapeño defumada e seca."
        case .GyuKaku:
            return "Existem mais de 700 restaurantes Gyu-Kaku em todo o mundo, e o primeiro local nos EUA foi inaugurado em West Los Angeles em 2001. Nosso restaurante premiado foi premiado com o Prêmio Hot Concept em 2007 e a demanda continua crescendo! Nossa experiência divertida e emocionante permite que todos possam desfrutar de um churrasco em sua mesa. A melhor parte? Nosso torrador sem fumaça. Com nosso sistema de down draft, a fumaça é sugada para o fundo da mesa e para longe dos convidados!"
        case .LaCantinaTacos:
            return "Comida de rua mexicana autêntica com os ingredientes mais frescos em nossos tacos, burritos e saladas. Ambiente casual e divertido com Margaritas e Cerveja. Grande valor!"
        }
        
        
    }
    
    
}
