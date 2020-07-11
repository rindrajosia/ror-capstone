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
      image_tag category.articles.last.image.url, class:'bg gradient img-latest-news'
    else
      image_tag asset_path('bg.jpg')
    end
  end

  def art_cat(category)
    if !category.articles.last.nil?
      category.articles.last.title
    else
      'No article'
    end
  end
end
