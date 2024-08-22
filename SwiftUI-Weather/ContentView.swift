//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Jayanth Gowda on 14/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var isNight:Bool = false
    
    var body: some View {
        ZStack{
            BackgroundGradientView(isNight: $isNight)
            VStack{
                CityNameLabel()
                CurrentWeatherView(iconName: isNight ? "moon.stars.fill": "cloud.sun.fill",
                                   temperature: 76)
                
                HStack(spacing: 25){
                    WeatherDayView(dayOfWeek: "MON",
                                   imageName: "cloud.sun.fill",
                                   temperature: 23)
                    WeatherDayView(dayOfWeek: "MON", 
                                   imageName: "cloud.sun.rain",
                                   temperature: 23)
                    WeatherDayView(dayOfWeek: "MON", 
                                   imageName: "snow",
                                   temperature: 23)
                    WeatherDayView(dayOfWeek: "MON", 
                                   imageName: "cloud.sun.bolt.fill",
                                   temperature: 23)
                    WeatherDayView(dayOfWeek: "MON", 
                                   imageName: "cloud.sun.rain.fill",
                                   temperature: 23)
                }
                Spacer()
                Button(action: {
                    isNight.toggle()
                }, label: {
                    WhiteButtonView(buttonTitle: "Change Day Time")
                })

                Spacer()

            }
        }
        
     
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek:String
    var imageName:String
    var temperature:Int
    
    var body: some View {
        VStack(spacing: 5){
            Text(dayOfWeek)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
            
            
        }.foregroundStyle(.white)
    }
}

struct BackgroundGradientView: View {
    @Binding var isNight:Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, .yellow]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
        .opacity(0.8)
    }
}

struct CityNameLabel: View {
    var body: some View {
        Text("Amsterdam, NL ")
            .foregroundStyle(.white)
            .padding(.top)
            .fontWeight(.bold)
            .font(.system(size: 32, weight: .medium, design: .default))
            .border(.black)
    }
}

struct CurrentWeatherView: View {
    var iconName:String
    var temperature:Int
    var body: some View {
        VStack(spacing: 1){
            Image(systemName: iconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200,height: 200,alignment: .center)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
            
        }.padding(.bottom,40)
    }
}

struct WhiteButtonView:View {
    var buttonTitle:String
    var width:CGFloat  = 280
    var height:CGFloat = 50
    var body: some View {
            Text(buttonTitle)
                .foregroundStyle(.blue)
                .font(.system(size: 20, weight: .bold, design: .default))
                .frame(width:width, height: height)
                .background(.white)
                .font(.title)
                .clipShape(.buttonBorder)


    }
}
