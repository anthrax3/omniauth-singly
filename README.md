# OmniAuth Singly

This is the official OmniAuth strategy for authenticating to Singly. To
use it, you'll need to sign up for an OAuth2 Application ID and Secret
on the [Singly Applications Page](https://singly.com/apps).

## Basic Usage

### Rails

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :singly, ENV['SINGLY_ID'], ENV['SINGLY_SECRET']
    end

### Sinatra

    use OmniAuth::Builder do
      provider :singly, ENV['SINGLY_ID'], ENV['SINGLY_SECRET']
    end

## Services

You can authorize many services through Singly. Link to

    /auth/singly?service=<service>

To see what services are supported, check the [Service
Overview](https://singly.com/docs/services_overview).

## Connecting multiple profiles

To connect a second (or Nth) profile to an existing account, include the user's
Singly `access_token` in the auth URL. Use this when, for example, the user has
logged in with Facebook and wants to also connect Twitter. If an `access_token`
is not included, no profile merging will _ever_ take place—either a new account
will be created or the user will log in to an existing account.

    /auth/singly?service=<service>&access_token=<token>

For more details, see the [authorization
documentation](https://singly.com/docs/authorization).

## Scope

Custome scopes can be passed through Singly to a service via the `scope`
parameter:

    /auth/singly?service=<service>&scope=<scope>

For more details, see the [authorization
documentation](https://singly.com/docs/authorization). To see what scopes are
available, check the documentation for the service you're using.

## License

Copyright (c) 2011 Singly, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
