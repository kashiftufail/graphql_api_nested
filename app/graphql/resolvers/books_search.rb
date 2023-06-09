require 'search_object'
require 'search_object/plugin/graphql'

class Resolvers::BooksSearch < GraphQL::Schema::Resolver
  # include SearchObject for GraphQL
  include SearchObject.module(:graphql)

  
  scope { Book.all }

  type [Types::BookType], null: false

  # inline input type definition for the advanced filter
  class BookFilter < ::Types::BaseInputObject
    argument :description_contains, String, required: false
    argument :title_contains, String, required: false
  end

  # when "filter" is passed "apply_filter" would be called to narrow the scope
  option :filter, type: BookFilter, with: :apply_filter

  # apply_filter recursively loops through "OR" branches
  def apply_filter(scope, value)
    branches = normalize_filters(value).reduce { |a, b| a.or(b) }
    scope.merge branches
  end

 def normalize_filters(value, branches = [])
    scope = Book.all
    scope = scope.where('description LIKE ?', "%#{value[:description_contains]}%") if value[:description_contains]
    scope = scope.where('title LIKE ?', "%#{value[:title_contains]}%") if value[:title_contains]

    branches << scope  

    branches
  end
end
