# frozen_string_literal: true

class ArticleBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :content, :author, :category, :published_at
end
