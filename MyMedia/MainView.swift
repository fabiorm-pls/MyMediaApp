//
//  ContentView.swift
//  MyMedia
//
//  Created by Fabio Rodriguez Martinez on 25/10/2021.
//

import SwiftUI

struct MainView: View {
    //menu

    //inicializar timer
    let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    //current date y hora
    @State var currentDate: Date = Date()
    var dateFormatter: DateFormatter{
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .short
        return formatter
    }
    @State private var isActive : Bool = false
    var body: some View {
        NavigationView{
            VStack{
                
                HStack{
                    VStack{
                    Image(systemName: "clock.fill")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .padding()
                    Text(dateFormatter.string(from:currentDate))
                        .font(.system(size: 20, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
                        .padding(.top)
                    }
                    VStack{
                        //temperatura
                    }
                }
                
                .onReceive(timer, perform: { value in
                    currentDate = value
                    
                })
                ZStack{
                    GeometryReader{ gr in
                        VStack{
                            Spacer()
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.secondary)
                                .frame(height: gr.size.height * 0.6)
                                .offset(y :40)
                            
                        }
                        
                        
                    }
                    VStack(){
                        //reloj
                        //temperatura
                        
                        HStack{
                            Button(action:{
                                //TODO ACTION
                            }){
                                VStack{
                                    Image("waze")
                                        .resizable()
                                        .aspectRatio(contentMode:.fit)
                                    Text("Waze")
                                    
                                    
                                }
                                .font(.title)
                                .frame(width: 150, height: 100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center)
                                .padding()
                                .foregroundColor(.white)
                                .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.blue]), startPoint: .top, endPoint: .bottom))
                                .cornerRadius(10)
                            }
                            Button(action:{
                                //TODO ACTION
                            }){
                                VStack{
                                    Image("spotify")
                                        .resizable()
                                        .aspectRatio(contentMode:.fit)
                                    Text("Spotify")
                                    
                                    
                                }
                                    .font(.title)
                                    .frame(width: 150, height: 100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .top, endPoint: .bottom))
                                    .cornerRadius(10)
                            }
                        }
                        HStack{
                            Button(action:{
                                //TODO ACTION
                            }){ VStack{
                                Image("phone")
                                    .resizable()
                                    .aspectRatio(contentMode:.fit)
                                Text("Teléfono")
                                
                                
                            }
                                    .font(.title)
                                    .frame(width: 150, height: 100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.orange]), startPoint: .top, endPoint: .bottom))
                                    .cornerRadius(10)
                            }
                            .frame(height: nil)
                            Button(action:{
                                //TODO ACTION
                            }){
                                VStack{
                                   Image("radio")
                                       .resizable()
                                       .aspectRatio(contentMode:.fit)
                                   Text("radio")
                                   
                                   
                               }
                                    .font(.title)
                                    .frame(width: 150, height: 100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.orange]), startPoint: .top, endPoint: .bottom))
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
            }
            .navigationTitle("MY MEDIA STATION")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: NavigationLink(
                    destination: SettingsScreen(),
                    label: {
                        Image(systemName: "menubar.arrow.down.rectangle")
                    }),
                trailing:
                    NavigationLink(
                    destination: AudioScreen(),
                    label: {
                        //cambiar imagen
                        Image(systemName: "speaker.fill")
                    })
            )
            .background(Color.secondary)
            
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
