import UIKit
import Foundation

var str = "Hello, Network"

let urlString = "https://www.google.com/search?q=picasso"

// URL struct
var url = URL(string: urlString)

if let url = url {
    print("URL: \(url)")
    print("Path: \(String(reflecting: url.path))")
    print("Query: \(String(reflecting: url.query))")
}

url?.appendPathComponent("ios")

// URLComponents, URLQueryItem
var urlComponent = URLComponents(string: urlString)

struct RachitMishra {
    let host = "rachitmishra.com"
}

urlComponent?.host = RachitMishra.init().host

struct GoogleSearch {
    static let scheme = "https"
    static let host = "photos.google.com"
    static let path = "/search"
    static let queryName = "query"
    static let udacitySearchTerm = "udacity"
}

var components = URLComponents()

// then modify the code to use the constants in the GoogleSearch struct

components.scheme = GoogleSearch.scheme
components.host = GoogleSearch.host
components.path = GoogleSearch.path
components.queryItems = [URLQueryItem(name: GoogleSearch.queryName, value: GoogleSearch.udacitySearchTerm)]

print(components.url!)

/**
 "Tasks" are what URLSession calls network requests.
 
 URLSessionDataTask: Used for perfuming an HTTP request (GET, POST, etc.).
 URLSessionDownloadTask: Downloading a file from a server.
 URLSessionUploadTask: Uploading a file to a server
 URLSessionStreamTask: Getting a continuous stream of data from a server.
 */

let task = URLSession.shared.dataTask(with: components.url!) { (data, urlResponse, error) in
    print(data)
}
task.resume()

// JSONSerialization

struct DogImage: Codable {
    let status: String
    let message: String
}

let dogApiUrl = URL(string: "https://dog.ceo/api/breeds/image/random")!

let dogApiTask = URLSession.shared.dataTask(with: dogApiUrl) { (data, urlResponse, error) in
    do {
//        let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:String]
//        print(json)
//        let urlFromJson = json["message"] as! String
//        print(urlFromJson)

        let decoder = JSONDecoder()
        let json = try decoder.decode(DogImage.self, from: data!)
        print(json.message)
    } catch {
        print("Error in parsing")
    }
}
dogApiTask.resume()

/**
 If you're making a function that takes a closure as a parameter (like dataTask does), ask is the code passed into the closure could run after this function is finished?
 
 If yes, mark the closure with @escaping.
 If no, do not mark the closure with @escaping
 */
