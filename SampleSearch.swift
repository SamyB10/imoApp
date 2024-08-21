import SwiftUI

struct SearchWithSuggestionsView: View {
    @State private var searchText: String = ""
    @State private var suggestions: [String] = []
    @State private var showSuggestions: Bool = false

    // Exemple de données de suggestions
    let allSuggestions = ["Apple", "Banana", "Cherry", "Date", "Elderberry", "Fig", "Grape"]

    var body: some View {
        VStack {
            HStack {
                TextField("Search...", text: $searchText, onEditingChanged: { isEditing in
                    showSuggestions = isEditing
                }, onCommit: {
                    // Action lorsque la recherche est soumise
                    showSuggestions = false
                })
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.leading, 8)

                Button(action: {
                    // Action du bouton, par exemple, nettoyer le texte de recherche
                    searchText = ""
                    showSuggestions = false
                }) {
                    Text("Clear")
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                .padding(.trailing, 8)
            }
            .padding()

            if showSuggestions {
                List(suggestions, id: \.self) { suggestion in
                    Text(suggestion)
                        .onTapGesture {
                            searchText = suggestion
                            showSuggestions = false
                        }
                }
                .frame(height: 200) // Limite la hauteur de la liste de suggestions
            }

            // Contenu de la vue
            Text("Search results for: \(searchText)")
                .padding()
        }
        .onChange(of: searchText) { newValue in
            // Filtrer les suggestions en fonction du texte de recherche
            if !newValue.isEmpty {
                suggestions = allSuggestions.filter { $0.lowercased().contains(newValue.lowercased()) }
            } else {
                suggestions = []
            }
        }
    }
}

struct SearchWithSuggestionsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchWithSuggestionsView()
    }
}
