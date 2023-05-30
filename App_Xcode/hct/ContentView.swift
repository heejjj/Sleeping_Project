import SwiftUI
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    
    // 앱이 foreground에서 알림을 수신할 때 동작을 처리하는 코드를 추가할 수 있습니다.
}

struct LoadingView: View {
    @State private var isLoading = true
    
    var body: some View {
        ZStack {
            // 로딩 화면 배경 설정
            Color.white
            // 로딩 인디케이터 및 텍스트 표시
            VStack {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .purple))
                    .scaleEffect(2)
                
                Text("로딩 중...")
                    .font(.headline)
                    .foregroundColor(.purple)
                    .padding(.top, 10)
            }
        }
        .ignoresSafeArea()
        .opacity(isLoading ? 1 : 0) // 로딩 상태에 따라 화면 표시/숨김
        .animation(.easeInOut(duration: 0.3), value: isLoading) // 변경된 애니메이션 메서드 사용
                }
            }
        
    
struct ContentView: View {
    @State private var isLoading = true
    @State private var isMoonVisible = false
    @State private var isTapped = false
    
    var body: some View {
        NavigationView {
            ZStack {
                if isLoading {
                    ZStack{Color.black.edgesIgnoringSafeArea(.all)
                        VStack {
                            Text("Lite Right")
                                .font(.system(size: 60))
                                .bold()
                                .foregroundColor(.white)
                                .padding(.top,300)
                            
                    
                            Text("Press AnyWhere")
                                .font(.system(size: 15)).bold()
                                .opacity(isMoonVisible ? 1 : 0)
                                .animation(Animation.easeInOut(duration: 1).repeatForever(), value: isMoonVisible)
                                .foregroundColor(.white)
                                .padding(.top,400)
                        }
                        .onTapGesture {
                            isLoading = false
                            isTapped = true
                        }
                    }
                    
                    Image(systemName: "moon.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.purple)
                        .padding(.bottom, 450)
                        .opacity(isMoonVisible ? 1 : 0)
                        .animation(Animation.easeInOut(duration: 3).repeatForever(), value: isMoonVisible)
                        .onAppear {
                            withAnimation {
                                isMoonVisible = true
                            }
                        }
                } else {
                      Image("backgroundimage")
                          .resizable()
                          .aspectRatio(contentMode: .fill)
                          .edgesIgnoringSafeArea(.all)
                      
                      VStack {
                          Text("Lite Right")
                              .font(.system(size: 60)).bold()
                              .padding(.top,0)
                              .foregroundColor(.white)
                          
                          Image("cat")
                              .resizable()
                              .frame(width: 250, height: 250)
                              .padding(.top,10)
                          
                          Text("Transform Your Sleep Habits")
                              .font(.system(size: 23)).bold()
                              .padding(.top,2)
                          
                          Text("With Our")
                              .font(.system(size: 23)).bold()
                          
                          Text("Ultimate Sleepmate")
                              .font(.system(size: 23)).bold()
                          
                          NavigationLink(destination: Main()) {
                              Text("꿀잠 자러가기")
                                  .font(.headline)
                                  .foregroundColor(.white)
                                  .padding()
                                  .background(Color.purple)
                                  .cornerRadius(15.0)
                          }
                          
                          HStack(spacing: 30) {
                              NavigationLink(destination: LoginView()) {
                                  Text("LOG IN")
                                      .font(.system(size: 25))
                                      .foregroundColor(.black)
                                      .bold()
                                      .padding(30)
                                      .background(Color("Color"))
                                      .cornerRadius(15.0)
                              }
                              
                              NavigationLink(destination: SignUpView()) {
                                  Text("REGISTER")
                                      .font(.system(size: 25))
                                      .foregroundColor(.white)
                                      .bold()
                                      .padding(30)
                                      .background(Color("Color 1"))
                                      .cornerRadius(10.0)
                              }
                          }
                          .padding(.top, 80)
                      }
                  }
              }
          }
      }
  }
    
    struct LoginView: View {
        @State private var email: String = ""
        @State private var password: String = ""
        
        var body: some View {
            VStack {
                Image(systemName: "moon")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.yellow)
                    .padding(.bottom, 30)
                
                TextField("이메일", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("비밀번호", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    // 로그인 버튼을 눌렀을 때 수행할 액션
                    // 로그인 처리 및 다음 화면으로 이동하는 로직을 구현
                }) {
                    Text("로그인")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.yellow)
                        .cornerRadius(15)
                }
                .padding(.top, 20)
                
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("로그인")
        }
    }
    
    struct SignUpView: View {
        @State private var email: String = ""
        @State private var password: String = ""
        @State private var confirmPassword: String = ""
        
        var body: some View {
            VStack {
                Image(systemName: "moon")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.purple)
                    .padding(.bottom, 30)
                
                TextField("이메일", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("비밀번호", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("비밀번호 확인", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: {
                    // 회원가입 버튼을 눌렀을 때 수행할 액션
                    // 회원가입 처리 및 다음 화면으로 이동하는 로직을 구현
                }) {
                    Text("회원가입")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.purple)
                        .cornerRadius(15)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("회원가입")
        }
    }
    //struct Main: View {
    //    @State private var isAlarmSet = false
    //
    //    var body: some View {
    //        ZStack {
    //            Image("backgroundimage")
    //                .resizable()
    //                .aspectRatio(contentMode: .fill)
    //                .edgesIgnoringSafeArea(.all)
    //
    //            VStack {
    //                Text("알람 설정하기")
    //                    .font(.system(size: 30))
    //                    .bold()
    //                    .padding(.bottom, 0)
    //
    //                Image(systemName: isAlarmSet ? "alarm.fill" : "alarm")
    //                    .resizable()
    //                    .aspectRatio(contentMode: .fit)
    //                    .frame(width: 200, height: 200)
    //                    .foregroundColor(isAlarmSet ? .red : .black)
    //
    //                Button(action: {
    //                    isAlarmSet.toggle()
    //                }) {
    //                    Text(isAlarmSet ? "알람 해제" : "알람 설정")
    //                        .font(.system(size: 25))
    //                        .foregroundColor(.black)
    //                        .bold()
    //                        .padding(20)
    //                        .background(Color("Color"))
    //                        .cornerRadius(15.0)
    //                }
    //            }
    //        }
    //    }
    //}
    
    
    
    struct Main: View {
        @State private var alarmTime = Date()
        @State private var isAlarmSet = false
        @State private var showAlert = false
        @State private var alertMessage = ""
        
        var body: some View {
            ZStack {
                Image("backgroundimage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    GroupBox {
                        Text("꿀잠에서 깰시간을 알려주세요!?")
                            .font(.system(size: 30))
                            .bold()
                            .foregroundColor(.purple)
                            .padding(.top, 20)
                        
                        DatePicker(
                            "알람 시간",
                            selection: $alarmTime,
                            displayedComponents: .hourAndMinute
                        )
                        .labelsHidden()
                        .datePickerStyle(.wheel)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("Color"))
                        )
                        
                        Button(action: {
                            scheduleAlarm()
                        }) {
                            Text("Set")
                                .font(.system(size: 25))
                                .foregroundColor(.purple)
                                .bold()
                                .padding(20)
                                .background(Color("Color1"))
                                .cornerRadius(15.0)
                        }
                    }.cornerRadius(40)
                        .shadow(radius: 39)
                    
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("알람 예약"),
                                message: Text(alertMessage),
                                dismissButton: .default(Text("확인"))
                            )
                        }
                    
                    NavigationLink(destination: Research()) {
                        Text("오늘은 어땠니?")
                            .font(.headline)
                            .foregroundColor(.purple)
                            .padding()
                            .background(Color("Color"))
                            .cornerRadius(15.0)
                    }
                    .padding(.top, 100)
                }
            }
        }
        
        func scheduleAlarm() {
            // 알람 컨텐츠 생성
            let content = UNMutableNotificationContent()
            content.title = "알람"
            content.body = "알람 시간입니다!"
            
            // 알람 시간 계산
            let calendar = Calendar.current
            let components = calendar.dateComponents([.hour, .minute], from: alarmTime)
            
            // 알람 트리거 생성
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            
            // 알람 요청 생성
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            
            // 알람 예약
            UNUserNotificationCenter.current().add(request) { error in
                if let error = error {
                    print("알람 예약 실패: \(error)")
                    showAlert = true
                    alertMessage = "알람 예약에 실패했습니다."
                } else {
                    print("알람이 예약되었습니다.")
                    isAlarmSet = true
                    showAlert = true
                    alertMessage = "알람이 예약되었습니다."
                }
            }
        }
        
        
        struct Research: View {
            @State private var button1Count = 0
            @State private var button2Count = 0
            @State private var button3Count = 0
            @State private var button4Count = 0
            @State private var button5Count = 0
            @State private var button6Count = 0
            @State private var button7Count = 0
            @State private var button8Count = 0
            @State private var button9Count = 0
            @State private var button10Count = 0
            @State private var button11Count = 0
            @State private var button12Count = 0
            
            var body: some View {
                ZStack {
                    Image("backgroundimage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        
                        Text("How Was Your Day?")
                            .font(.system(size: 35))
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                        
                        HStack{
                            Button(action: {
                                button1Count += 1
                            }) {
                                Text("Button 1 (\(button1Count))")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            
                            Button(action: {
                                button2Count += 1
                            }) {
                                Text("Button 2 (\(button2Count))")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.green)
                                    .cornerRadius(10)
                            }
                            
                            Button(action: {
                                button3Count += 1
                            }) {
                                Text("Button 3 (\(button3Count))")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.red)
                                    .cornerRadius(10)
                            }
                        }
                        HStack{
                            
                            Button(action: {
                                button4Count += 1
                            }) {
                                Text("Button 4 (\(button4Count))")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.orange)
                                    .cornerRadius(10)
                            }
                            
                            Button(action: {
                                button5Count += 1
                            }) {
                                Text("Button 5 (\(button5Count))")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.purple)
                                    .cornerRadius(10)
                            }
                            
                            Button(action: {
                                button6Count += 1
                            }) {
                                Text("Button 6 (\(button6Count))")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.yellow)
                                    .cornerRadius(10)
                            }
                        }
                        
                        VStack{
                            Text("What did you do today")
                                .font(.system(size: 35))
                                .bold()
                                .foregroundColor(.white)
                                .padding(.top,50)
                            
                            HStack{
                                Button(action: {
                                    button1Count += 1
                                }) {
                                    Text("Button 1 (\(button7Count))")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.blue)
                                        .cornerRadius(10)
                                }
                                
                                Button(action: {
                                    button2Count += 1
                                }) {
                                    Text("Button 2 (\(button8Count))")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.green)
                                        .cornerRadius(10)
                                }
                                
                                Button(action: {
                                    button3Count += 1
                                }) {
                                    Text("Button 3 (\(button9Count))")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.red)
                                        .cornerRadius(10)
                                }
                            }
                            HStack{
                                
                                Button(action: {
                                    button4Count += 1
                                }) {
                                    Text("Button 4 (\(button10Count))")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.orange)
                                        .cornerRadius(10)
                                }
                                
                                Button(action: {
                                    button5Count += 1
                                }) {
                                    Text("Button 5 (\(button11Count))")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.purple)
                                        .cornerRadius(10)
                                }
                                
                                Button(action: {
                                    button6Count += 1
                                }) {
                                    Text("Button 6 (\(button12Count))")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.yellow)
                                        .cornerRadius(10)
                                }
                            }
                            
                            
                        }
                        
                        Spacer()
                    }
                }
            }
        }
        
        struct ContentView_Previews: PreviewProvider{
            static var previews: some View{
                ContentView()
            }
        }
        
    }
