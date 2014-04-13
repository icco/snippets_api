SnippetsApi::App.helpers do
  # http://api.rubyonrails.org/classes/ActionView/Helpers/NumberHelper.html
  def nice_num num
    if num < 20
      I18n.with_locale(:en) { num.to_words }
    else
      ActionView::Base.new.number_to_human num
    end
  end

  # http://api.rubyonrails.org/classes/ActionView/Helpers/TextHelper.html#method-i-pluralize
  def pluralize word, cnt
    ActionView::Base.new.pluralize(cnt, word).split(' ').last
  end
end
