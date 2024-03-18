import SwiftUI

struct SelectFile: View {
    
    @State private var searchPrompt: String = ""
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                    // Welcome Text with profile picture
                    HStack{
                        Text("Files")
                            .bold()
                            .font(.system(size:20))
                        
                        Spacer()
                        NavigationLink(destination: Build()){
                            Text("Cancel").navigationBarBackButtonHidden(true)
                                .font(.system(size: 14))
                                .bold()
                                .foregroundColor(Color("customPurple"))
                        }
                        
                    }
                    .padding(20)
                    
                    //Search Textfield and search button
                    HStack(spacing: 0) {
                        TextField("Search files...", text: $searchPrompt)
                            .disableAutocorrection(true)
                            .font(.system(size: 16))
                            .padding([.leading], 15)
                            .padding([.vertical], 10)
                            .background(
                                UnevenRoundedRectangle(
                                    cornerRadii: .init(
                                        topLeading: 5,
                                        bottomLeading: 5)
                                )
                                .fill(Color("CustomGray")))
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        Button(action: {
                            print(searchPrompt)
                        }){
                            Image("searchicon")
                                .resizable()
                                .frame(width: 15.0, height: 15.0)
                                .padding([.horizontal], 13.0)
                                .padding([.vertical], 13.0)
                                .background(UnevenRoundedRectangle(
                                    cornerRadii: .init(
                                        bottomTrailing: 5,
                                        topTrailing: 5)
                                )
                                    .fill(Color("CustomGray")))
                        }
                        
                    }
                    .padding([.horizontal], 20)
                    
                    
                    //3D Model Picture
                    //TODO: link to preinstructions
                    // PreInstructions(preInstructionsView: $preInstructionsView)
                    NavigationLink(destination: PreInstructions(preInstructionsView: .constant(true))){
                        HStack {
                            Image("asteroidIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 65.0)
                                .padding([.top, .leading, .bottom])
                            
                            VStack {
                                HStack {
                                    Text("Asteroid")
                                        .bold()
                                        .font(.system(size: 16))
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                HStack{
                                    Text("5.4 MB")
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                    
                                    Spacer()
                                }
                            }
                            
                            Spacer()
                        }
                        .frame(width: 342, height: 65)
                        .background(Color("CustomGray"))
                        .cornerRadius(10)
                    }
                    
                    //Mountain
                    Button(action: {
                        // Action for the main button
                        print("Main Button Tapped")
                    }) {
                        HStack {
                            Image("cubeIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 65.0)
                                .padding([.top, .leading, .bottom])
                            
                            VStack {
                                HStack {
                                    Text("Cube")
                                        .bold()
                                        .font(.system(size: 16))
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                HStack{
                                    Text("2.3 MB")
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                    
                                    Spacer()
                                }
                            }
                            
                            Spacer()
                        }
                        .frame(width: 342, height: 65)
                        .background(Color("CustomGray"))
                        .cornerRadius(10)
                        
                    }
                    
                    .padding(.vertical, 5.0)
                    
                    //Human Figure
                    Button(action: {
                        // Action for the main button
                        print("Main Button Tapped")
                    }) {
                        HStack {
                            Image("skullIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 65.0)
                                .padding([.top, .leading, .bottom])
                            
                            VStack {
                                HStack {
                                    Text("Skull")
                                        .bold()
                                        .font(.system(size: 16))
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                HStack{
                                    Text("7.2 MB")
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                    
                                    Spacer()
                                }
                            }
                            
                            Spacer()
                        }
                        .frame(width: 342, height: 65)
                        .background(Color("CustomGray"))
                        .cornerRadius(10)
                        
                    }
                    
                    .padding(.vertical, 5.0)
                    
                    
                }
            }
        }
    }
    
}

#Preview {
    SelectFile()
}
