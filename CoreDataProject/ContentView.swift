//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Philipp Sanktjohanser on 23.12.22.
//

import CoreData
import SwiftUI

enum predicate: String, CaseIterable {
    case beginsWith = "BEGINSWITH"
    case contains = "CONTAINS[c]"
    case equals = "=="
    case greaterThan = ">"
    case lessThan = "<"
}

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var sortDescriptor = [SortDescriptor<Singer>]()
    @State private var lastNameFilter = "A"
    @State private var filterKey = "lastName"
    @State private var predicateFilter = predicate.beginsWith.rawValue
    
    var body: some View {
        VStack {
            FilteredList(sortDescriptors: sortDescriptor, filterKey: filterKey, predicate: predicateFilter, filterValue: lastNameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                let adkins = Singer(context: moc)
                adkins.firstName = "Ben"
                adkins.lastName = "Adkins"
                
                let adkins1 = Singer(context: moc)
                adkins1.firstName = "Tom"
                adkins1.lastName = "Adkins"
                
                try? moc.save()
            }
            
            VStack {
                HStack {
                    Button("SortDescriptor: none") {
                        sortDescriptor = []
                    }
                    .font(.caption)
                    .foregroundColor(.primary)
                    .frame(width: 100, height: 44)
                    .background(.yellow)
                    .padding()
                    
                    Button("SortDescriptor: first name") {
                        sortDescriptor = [SortDescriptor(\.firstName)]
                    }
                    .font(.caption)
                    .foregroundColor(.primary)
                    .frame(width: 100, height: 44)
                    .background(.yellow)
                    .padding()
                    
                    Button("SortDescriptor: last name + reversed first name") {
                        sortDescriptor = [SortDescriptor(\.lastName), SortDescriptor(\.firstName, order: .reverse)]
                    }
                    .font(.caption)
                    .foregroundColor(.primary)
                    .frame(width: 100, height: 80)
                    .background(.yellow)
                    .padding()
                }
                
                HStack {
                    Button("Filter: A") {
                        lastNameFilter = "A"
                    }
                    .font(.caption)
                    .foregroundColor(.primary)
                    .frame(width: 100, height: 44)
                    .background(.red)
                    .padding()
                    
                    Button("Filter: E") {
                        lastNameFilter = "E"
                    }
                    .font(.caption)
                    .foregroundColor(.primary)
                    .frame(width: 100, height: 44)
                    .background(.red)
                    .padding()
                    
                    Button("Filter: S") {
                        lastNameFilter = "S"
                    }
                    .font(.caption)
                    .foregroundColor(.primary)
                    .frame(width: 100, height: 44)
                    .background(.red)
                    .padding()
                }
                
                HStack {
                    Button("Object: first name") {
                        filterKey = "firstName"
                    }
                    .font(.caption)
                    .foregroundColor(.primary)
                    .frame(width: 100, height: 44)
                    .background(.blue)
                    .padding()
                    
                    Button("Object: last name") {
                        filterKey = "lastName"
                    }
                    .font(.caption)
                    .foregroundColor(.primary)
                    .frame(width: 100, height: 44)
                    .background(.blue)
                    .padding()
                }
                
                HStack {
                    Button("Predicate: Contains") {
                        predicateFilter = predicate.contains.rawValue
                    }
                    .font(.caption)
                    .foregroundColor(.primary)
                    .frame(width: 100, height: 44)
                    .background(.green)
                    .padding()
                    
                    Button("Predicate: Begins with") {
                        predicateFilter = predicate.beginsWith.rawValue
                    }
                    .font(.caption)
                    .foregroundColor(.primary)
                    .frame(width: 100, height: 44)
                    .background(.green)
                    .padding()
                    
                    Button("Predicate: Random") {
                        predicateFilter = predicate.allCases.randomElement()?.rawValue ?? "BEGINSWITH"
                        print(predicateFilter)
                    }
                    .font(.caption)
                    .foregroundColor(.primary)
                    .frame(width: 100, height: 44)
                    .background(.green)
                    .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
