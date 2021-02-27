//
//  MenuDetailView.swift
//  Ian Pizza Company
//
//  Created by 紀詠恩 on 2020/12/5.
//

import SwiftUI

struct MenuDetailView: View {
    
    @EnvironmentObject var settings:UserPreferences
    @ObservedObject var orderModel:OrderModel
    @State var didOrder:Bool = false
    @State var quantity:Int = 1
    
    @State var testLastId = OrderModel().lastOrderID
    
    var menuItem:MenuItem
    var formattedPrice:String{
        String(format:"%3.0f", Double(menuItem.price) * Double(quantity))}
    
    func addItem(){
        orderModel.add(menuID: self.menuItem.id, size: .small, quantity: self.quantity, comments: "")
    }
    func order(){
        didOrder = true
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("\(menuItem.name)   \(menuItem.price)元")
                    .font(.custom("NotoSansCJKtc-Bold", size: 23))
            }
            .cornerRadius(10)
            SelectedImageView(image: "\(menuItem.id)_pizza")
            .font(.headline)
            .padding(4)
            Text("\(menuItem.description)")
                .font(.custom("NotoSansCJKtc-Regular", size: 15))
                .padding([.leading, .trailing], 10)
                .lineLimit(4)
            QuantityStepperView(quantity: $quantity)
                .font(.custom("NotoSansCJKtc-Regular", size: 15))
                .padding([.leading, .trailing], 20)

            HStack{
                Text("小計：\(formattedPrice)元")
                Spacer()
                Text("購物車金額：\(orderModel.formattedTotal)元")

            }
            .font(.custom("NotoSansCJKtc-Regular", size: 15))
            .padding([.leading, .trailing], 20)

            Spacer()
            HStack{
                Button(action: order) {
                   Text("加入訂單")
                    .font(.title)
                    .fontWeight(.medium)
                }.padding()
                .background(Color("O1"))
                .foregroundColor(.white)
                .cornerRadius(10)
            }.padding(.bottom)
            .alert(isPresented: $didOrder){
                Alert(title: Text("確認訂單"), message: Text("是否要訂購\(quantity)個 \(menuItem.name)？"), primaryButton: .destructive(Text("取消")), secondaryButton: .default(Text("確認")){addItem()})
            }
        }
        .background(Color(.systemGray4))
        .cornerRadius(10)
    }
}

struct MenuDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MenuDetailView(orderModel: OrderModel(), menuItem: testMenuItem)
    }
}

struct QuantityStepperView: View {
    @Binding var quantity:Int
    var body: some View {
        Stepper(value: $quantity, in: 1...10){
            Text("數量：\(quantity)")
        }
    }
}

struct SizePickerView: View {
    @Binding var size:Size
    let sizes:[Size] = [.small,.medium,.large]
    var body: some View {
        Picker(selection:$size, label:Text("Pizza Size")){
            ForEach(sizes, id:\.self){ size in
                Text(size.formatted()).tag(size)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
        .font(.headline)
    }
}
