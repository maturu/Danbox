module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Danbox"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def default_meta_tags
    {
      site: 'Danbox',
      title: 'Home',
      reverse: true,
      charset: 'utf-8',
      description: 'ダンボールを使った工作やアートなどのあらゆる作品を画像投稿機能を使って共有し、ダンボールの限界に挑むための新しいSNSです。',
      keywords: 'Danbox, danbox, Cardboard, Cardboard Art, Craft, ダンボックス, ダンボール工作, ダンボールアート, 工作, danbox sns, ダンボール sns, 工作 sns, craft sns, ダンボール webサービス',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('icon.png') },
      ],
      og: {
        url: request.original_url,
        title: 'ダンボール工作系SNS「Danbox」',
        description: :description,
        image: image_url('logo-inversion.jpg'),
      },
      twitter: {
        card: 'summary_large_image',
        site: '@Danbox_sns',
      }
    }
  end
end
