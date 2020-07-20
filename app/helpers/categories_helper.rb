module CategoriesHelper
  def art_thumb(cat)
    x = y = 1
    html = ''
    cat.each do |art|
      if x.odd?
        html += "<div class='cat-art-image' style='background-image: url(#{art.image.url});'>".html_safe
        html += "</div><div class='cat-art'><ul> <li>".html_safe
        html += link_to art.title.truncate(50), path_art(art), method: :get, class: 'cat-art-title'
        html += '</li><li class="word-wrap">'.html_safe + art.text.truncate(200)
        html += "</li> <li> Author:<span class='author'>".html_safe + art.author.name
        html += '</span></li><li>'.html_safe
        html += link_to 'vote', votes_path(article_id: art.id, category_id: @category_id), method: :post, class: 'but'
        html += "<span class='vote'> (".html_safe + art.number_of_votes.to_s
        html += ")</span> </li><li class='vote'>".html_safe
        html += link_to 'Read more', article_path(id: art.id), method: :get
        html += '</li></ul>'.html_safe
      else
        html += "<div class='cat-art'><ul><li>".html_safe
        html += link_to art.title.truncate(50), path_art(art), method: :get, class: 'cat-art-title'
        html += '</li><li class="word-wrap">'.html_safe + art.text.truncate(200)
        html += "</li><li> Author:<span class='author'>".html_safe + art.author.name
        html += '</span></li><li>'.html_safe
        html += link_to 'vote', votes_path(article_id: art.id, category_id: @category_id), method: :post, class: 'but'
        html += "<span class='vote'> (".html_safe + art.number_of_votes.to_s
        html += ")</span></li><li class='vote'>".html_safe
        html += link_to 'Read more', article_path(id: art.id), method: :get
        html += "</li></ul></div><div class='cat-art-image' style='background-image: url(#{art.image.url});'>".html_safe
      end
      x += 1 if y.even?
      y += 1
      html += '</div>'.html_safe
    end

    html.html_safe
  end
end
