import SwiftUI

let aqua = Color("aqua")

struct ContentView: View {
    var body: some View {
        TabView {
            
            MainView()
                .tabItem {
                    Image("home")
                        .renderingMode(.template)
                }
        
            NotificationsView()
                .tabItem {
                    Image("notify")
                        .renderingMode(.template)
                }
                    
            SearchView()
                .tabItem {
                    Image("user")
                        .renderingMode(.template)
                }
            
            SettingsView()
                .tabItem {
                    Image("settings")
                        .renderingMode(.template)
                }
        }
        .accentColor(Color(UIColor(red: 0.49, green: 0.4, blue: 1.0, alpha: 1.0)))
    }
}

struct MainView: View {
    var body: some View {
        ScrollView {
            LogoView()
            VStack(spacing: 21) {
                ButtonRowView()
                VStack(spacing: 16) {
                    ContentCardView(
                        username: "@vitas",
                        time: "20 мин назад",
                        title: "Рецензия на книгу – “Унесенные ветро”. Трагедия Скарлетт и Батлера",
                        text: "Роман Маргарет Митчелл \"Унесённые ветром\" — это эпическая сага о любви, выживании и внутренней силе, разворачивающаяся на фоне Американской гражданской войны и последующей реконструкции Юга. Этот роман остаётся одной из самых известных и популярных книг 20 века, во многом благодаря своим многослойным персонажам, богатому историческому контексту и напряжённым сюжетным поворотам."
                    )
                    ContentCardView(
                        username: "@tomatte",
                        time: "1ч назад",
                        title: "Таково уж свойство надежды: она возрождается снова и снова, пока человек ещё молод и не привык терпеть неудачи.",
                        titleWithQuotes: true,
                        text: "Роман Маргарет Митчелл \"Унесённые ветром\" — это эпическая сага о любви, выживании и внутренней силе, разворачивающаяся на фоне Американской гражданской войны и последующей реконструкции Юга. Этот роман остаётся одной из самых известных и популярных книг 20 века, во многом благодаря своим многослойным персонажам, богатому историческому контексту и напряжённым сюжетным поворотам.",
                        source: "Марк Твен\n«Приключения Тома Сойера»"
                    )
                    DiscussionCardView(
                        username: "@readermatures",
                        time: "12 октября",
                        title: "Обсуждение “Унесенные ветром”"
                    )
                    ContentCardView(
                        username: "@vitas",
                        time: "20 мин назад",
                        withRect: true,
                        title: "Антуан де Сент — Экзюпери. «Маленький принц». Лучшие фразы ",
                        text: "Зорко одно лишь сердце.\nАнтуан де Сент-Экзюпери был необычным ребенком. Он писал стихи, рисовал, учился играть на скрипке. Друг семьи, летчик Ведрин, однажды взял с собой в полет 12 летнего Антуана. И мальчик «заболел» небом. Но родители были против такого увлечения для потомка графского рода. Тогда он поступил в школу изящных искусств, чтобы стать архитектором. Когда Антуана призвали в армию, он попал в авиационный полк. Здесь и началась первая профессия будущего летчика. Но была и вторая профессия – писатель. В 1935 году самолет Экзюпери потерпел аварию в Ливийской пустыне, летчик провел там несколько дней, прежде чем смог вылететь обратно. Может быть, именно тогда и пришла к писателю идея сказки о Маленьком принце.\nВ центре повествования — сильная и противоречивая героиня Скарлетт О'Хара. Скарлетт олицетворяет множество качеств, которые вызывают противоречивые чувства у читателей: с одной стороны, она упряма, эгоистична и безжалостна в своих действиях, но с другой — её несломленная воля к жизни и готовность бороться за то, что она считает важным, вызывает восхищение. В течение романа она эволюционирует, проходя путь от наивной девушки до женщины, которая осознаёт жестокие реалии жизни."
                    )
                }
                .padding(.horizontal, 4)
            }
        }
        .background(Color(.systemGray6))
    }
}

struct LogoView: View {
    var body: some View {
        HStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 39)
            Spacer()
        }
        .frame(height: 80)
        .padding(.horizontal, 16)
    }
}

struct ButtonRowView: View {
    @State private var isAboutViewPresented = false
    @State private var isGlueViewPresented = false

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ButtonView(title: "Обсуждение \"Generation P\"") {
                    isGlueViewPresented = true
                }
                
                ButtonView(title: "Обзор новой книги Пелевина \"Круть\"") {
                    isGlueViewPresented = true
                }
                
            }
            .padding(.horizontal, 4)
            .fullScreenCover(isPresented: $isAboutViewPresented) {
                AboutView()
            }
            .fullScreenCover(isPresented: $isGlueViewPresented) {
                GlueView()
            }
        }
    }
}

struct ButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack {
                Spacer()
                HStack() {
                    Text(title)
                        .font(.system(size: 16, weight: Font.Weight.medium))
                        .foregroundColor(.black)
                    Spacer()
                }
            }
            .padding(12)
            .frame(width: 200, height: 110)
            .background(Color.white)
            .cornerRadius(16)
        }
    }
}

struct ContentCardView: View {
    var username: String
    var time: String
    var withRect = false
    var title: String
    var titleWithQuotes = false
    var text: String
    var source: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // инфа о юзере
            HStack {
                Text(username)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                Text(time)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            if withRect {
                Rectangle()
                    .fill(Color(red: 1.0, green: 0.416, blue: 0.373))
                    .frame(height: 142)
                    .cornerRadius(12)
            }
            
            VStack(spacing: 8) {
                if(titleWithQuotes) {
                    HStack {
                        VStack {
                            Spacer()
                            Text("“")
                                .font(.system(size: 50))
                                .fontWeight(.medium)
                        }
                        .frame(height: 1)
                        .padding(.top, 16)
                        Spacer()
                    }
                }
                Text(title)
                    .font(.system(size: 24))
                    .fontWeight(.medium)
                if(titleWithQuotes) {
                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                            Text("“")
                                .font(.system(size: 50))
                                .fontWeight(.medium)
                        }
                        .frame(height: 1)
                        .padding(.top, 16)
                    }
                }
            }
            
            Text(text)
                .font(.system(size: 16))
                .lineLimit(7)
            
            if let source = source  {
                Text(source)
                    .font(.system(size: 16))
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 28) {
                Spacer()
                Image("share")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                Image("bookmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
            }
            .padding(10)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 12)
        .background(Color.white)
        .cornerRadius(12)
    }
}

struct DiscussionCardView: View {
    var username: String
    var time: String
    var title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Верхняя информация о пользователе
            HStack {
                Text(username)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                Text(time)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
           
            
            VStack(spacing: 19) {
                Circle()
                    .fill(Color(red: 1.0, green: 0.416, blue: 0.373))
                    .frame(width: 107, height: 107)
                Text(title)
                    .font(.system(size: 24))
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                HStack(spacing: 8) {
                    Text("Посмотреть переписку")
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .frame(height: 51)
                        .padding(.horizontal, 18)
                        .background(Color(red: 224 / 255, green: 224 / 255, blue: 224 / 255))
                        .cornerRadius(12)
                    Text("Вступить")
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(height: 51)
                        .padding(.horizontal, 18)
                        .background(.black)
                        .cornerRadius(12)
                }
            }.frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 8)
        .padding(.vertical, 12)
        .background(Color.white)
        .cornerRadius(12)
    }
}

struct NotificationsView: View {
    var body: some View {
        Text("Уведомления")
            .font(.largeTitle)
            .foregroundColor(.gray)
    }
}

struct SearchView: View {
    var body: some View {
        Text("Пользователь")
            .font(.largeTitle)
            .foregroundColor(.gray)
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Настройки")
            .font(.largeTitle)
            .foregroundColor(.gray)
    }
}

#Preview {
    ContentView()
}
