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
        //formatter.dateStyle = .medium
        formatter.dateFormat = "dd/MM"
        formatter.timeStyle = .short
        formatter.amSymbol = ""
        formatter.pmSymbol = ""
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
                            //.background(Image ("road"))
                            //.aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            
                        Text(dateFormatter.string(from:currentDate))
                            .font(.system(size: 50, weight: .light, design:.rounded))
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .minimumScaleFactor(0.1)
                            .padding(.top)
                    }
                    VStack{
                        Text("Temperatura")
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
                                .fill(Color.black)
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
                                    Text("Waze").font(Font.custom("hind-light",size: 20))
                                    
                                    
                                }
                                .frame(maxWidth: .infinity, maxHeight: 120/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color("wazeColor"))
                                .cornerRadius(5)
                            }
                            Button(action:{
                                //TODO ACTION
                            }){
                                VStack{
                                    Image("spotify")
                                        .resizable()
                                        .aspectRatio(contentMode:.fit)
                                    Text("Spotify").font(Font.custom("hind-light",size: 20))
                                    
                                    
                                }
                                
                                .frame(maxWidth: .infinity, maxHeight: 120/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color("spotifyColor"))
                                .cornerRadius(5)
                            }
                        }
                        HStack{
                            Button(action:{
                                //TODO ACTION
                            }){ VStack{
                                Image("phone")
                                    .resizable()
                                    .aspectRatio(contentMode:.fit)
                                Text("Teléfono").font(Font.custom("hind-light",size: 20))
                                
                                
                            }
                            
                            .frame(maxWidth: .infinity, maxHeight: 120/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("orangeCustom"))
                            .cornerRadius(5)
                            }
                            .frame(height: nil)
                            Button(action:{
                                //TODO ACTION
                            }){
                                VStack{
                                    Image("radio")
                                        .resizable()
                                        .aspectRatio(contentMode:.fit)
                                    Text("Radio").font(Font.custom("hind-light",size: 20))
                                    
                                    
                                }
                                
                                .frame(maxWidth: .infinity, maxHeight: 120/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color("orangeCustom"))
                                .cornerRadius(5)
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
            .background(
                Image("road")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    
                
            )
            
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
