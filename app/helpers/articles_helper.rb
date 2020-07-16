module ArticlesHelper
  def image_art(popular_article)
    if !popular_article.nil?
      popular_article.image.url
    else
      asset_path('bg.jpg')
    end
  end

  def tilte_art(popular_article)
    if !popular_article.nil?
      popular_article.title
    else
      'No article'
    end
  end

  def text_art(popular_article)
    if !popular_article.nil?
      popular_article.text.truncate(200)
    else
      'No article'
    end
  end

  def image_cat(category)
    if !category.articles.last.nil?
      category.articles.last.image.url
    else
      asset_path('bg.jpg')
    end
  end

  def art_cat(category)
    if !category.articles.last.nil?
      category.articles.last.title
    else
      'No article'
    end
  end

  def path_art(popular_article)
    if !popular_article.nil?
      article_path(id: popular_article.id)
    else
      '#'
    end
  end

  def path_art_cat(category)
    if !category.articles.last.nil?
      article_path(id: category.articles.last.id)
    else
      '#'
    end
  end
end
