# OmniAuth Everyplay

This gem contains the Everyplay strategy for OmniAuth 1.0.

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-everyplay', '~> 1.0.0'
```

Then `bundle install`.

## Basic Usage

    use OmniAuth::Builder do
    	provider "everyplay", ENV['EVERYPLAY_CLIENT_ID'], ENV['EVERYPLAY_SECRET']
    end

## Supported Flows

Supports the Server-side Flow as described in the the [Everyplay docs](http://developers.everyplay.com/).

## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:
```ruby
{
  "provider" => "everyplay",
  "uid" => 1,
  "info" => {
    "username" => "Nomon",
    "permalink" => "nomon",
    "image" => "https://the.avatar.url"
  },
  "credentials" => {
    "token" => "123-321",
    "expires" => false
  },
  "extra" => {
    "raw_info" => {
          "id": 1,
          "hidden": false,
          "avatar_url_small": "https://www.everyplay.com/assets/img/icon-default-avatar-small.png",
          "avatar_url": "https://www.yammer.com/mugshot/75x75/2270139",
          "cover_url": "https://www.everyplay.com/assets/img/icon-default-cover.jpeg",
          "username": "Nomon",
          "permalink": "nomon",
          "created_at": "2013-01-06T09:31:01.037Z",
          "games_count": 4,
          "online": false,
          "video_count": 116,
          "followings_count": 32,
          "followers_count": 118,
          "permalink_url": "https://m.everyplay.com/nomon", \
          "uri": "https://api.everyplay.com/users/1", \
          "video_likes_count": 1,
          "kind": "user",
          "user_followed": false
    }
  }
}
```

## Thanks & Credits

[omniauth](https://github.com/intridea/omniauth)

[omniauth-soundcloud](https://github.com/soundcloud/omniauth-soundcloud)

[Matti Savolainen](https://github.com/Nomon)

## License

Original work Copyright (c) 2011 by Lee Martin and SoundCloud   
Modified work Copyright (c) 2013 by Matti Savolainen and Applifier 

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
