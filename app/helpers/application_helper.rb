module ApplicationHelper
  def default_meta_tags
    {
      site: 'バチェラーダービー4',
      description: '「バチェラー4」の優勝予想をする放置ゲーム',
      charset: 'utf-8',
      icon: [
        { href: image_url('favicon.png'), type: 'image/png' },
        { href: image_url('favicon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' }
      ],
      og: {
        site_name: :site,
        title: :site,
        type: 'website',
        description: '「バチェラー4」の優勝予想をする放置ゲーム',
        url: request.url,
        image: image_url('twitter_card.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        image: {
          _: image_url('twitter_card.png'),
          width: 300,
          height: 160
        },
        creator: '@aoki_engineer',
        site: '@aoki_engineer'
      }
    }
  end

  def admin_url?
    request.url.include?('/admin')
  end
end
