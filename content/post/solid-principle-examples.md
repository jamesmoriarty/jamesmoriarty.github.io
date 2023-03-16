+++
author = "James Moriarty"
title = "SOLID Principle Examples"
date = "2023-03-15"
description = ""
categories = ["programming"]
tags = []
+++

Throughout my career I've applied and tested solutions against [SOLID Principles](https://en.wikipedia.org/wiki/SOLID). These principles were conceived to make object-oriented designs more understandable, flexible, and maintainable. The following examples illustrate each principle:

- [Single Responsibility Principle](#single-responsibility-principle)
- [Open/Closed Principle](#openclosed-principle)
- [Liskov Substitution Principle](#liskov-substitution-principle)
- [Interface Segregation Principle](#interface-segregation-principle)
- [Dependency Inversion Principle](#dependency-inversion-principle)

## Single Responsibility Principle

> "There should never be more than one reason for a class to change."

By separating responsibilities into different classes, changes to one part of the code are less likely to affect other parts of the code. Take the following `Download` service class - it has a specific use-case given its limited inputs and expected behavior:

```ruby
module Services
  class Download
    attr_reader :file, :uri

    def initialize(file:, uri:)
      @file = file
      @uri = uri
    end

    def call
      open(uri) { |src| file.write(src.read) }
      file.close
      file.path
    end
  end
end
```

## Open/Closed Principle

> "Software entities ... should be open for extension, but closed for modification."

In other words, new behavior should be added by writing new code that builds upon the existing code without modifying it. This can allow significant new behaviors without material refactoring. Take the following example behavior classes:

```ruby
module Services
  module AlertChannels
    class Email
      def notify(user, message)
        send_email(user.email, message)
      end

      # ...
    end
  end
end
```

```ruby
module Services
  module AlertChannels
    class SMS
      def notify(user, message)
        send_sms(user.mobile_number, message)
      end

      # ...
    end
  end
end
```

And closed example open of extension:

```ruby
class User
  def notify(message)
    alert_channel.notify(self, message)
  end

  # ...
end
```

## Liskov Substitution Principle

> "Functions that use pointers or references to base classes must be able to use objects of derived classes without knowing it."

By constraining dependencies on the receiver - we can substitute it without making changes to the caller. Take the following substitutable receivers:

```ruby
module FileRepository
  module AWS
    class S3 < Repository
      def all(prefix:, page:, per_page:)
        # ...
      end

      # ...
    end
  end
end
```

```ruby
module FileRepository
  module Google
    module Cloud
      class Storage < Repository
        def all(prefix:, page:, per_page:)
          # ...
        end

        # ...
      end
    end
  end
end
```

And and example of a caller with no knowledge of substitution:

```ruby
repository = FileRepository::AWS::S3.new(bucket: ENV["AWS_S3_BUCKET"])

# GET /api/files
# GET /api/files/1
map("/api") do
  run API.configure(repository: repository)
end
```

## Interface Segregation Principle

> "Clients should not be forced to depend upon interfaces that they do not use."

We can further ensure decoupling components removing unnecessary potential dependencies. This can be extremely important for limiting dependencies on components we don't control e.g. third-party clients. Take the following segregated interfaces:

```ruby
module Operations
  module ContentRead
    def get(id)
      # ...
    end
  end
end
```

```ruby
module Operations
  module ContentWrite
    def put(id, content)
      # ...
    end
  end
end
```

And utilization of different clients:

```ruby
class ContentConsumer
  include Operations::ContentRead
end
```

```ruby
class ContentAdmin
  include Operations::ContentRead
  include Operations::ContentWrite
end
```

## Dependency Inversion Principle

> "Depend upon abstractions, [not] concretions."

By allowing the caller to control the receivers dependency we can further extend components. This is extremely useful for configuration and testing. Take the following injection of two different dependencies.

```ruby
Logger.new(io = StringIO.new))
```

```ruby
Logger.new(io = STDOUT))
```
