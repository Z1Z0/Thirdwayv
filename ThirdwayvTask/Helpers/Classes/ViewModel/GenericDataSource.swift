//
//  GenericDataSource.swift
//  ThirdwayvTask
//
//  Created by Ahmed Abd Elaziz on 03/02/2022.
//

import Foundation

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}
