import Bool "mo:base/Bool";

import Array "mo:base/Array";
import List "mo:base/List";
import Time "mo:base/Time";
import Result "mo:base/Result";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Option "mo:base/Option";

actor {
  type Post = {
    id: Nat;
    title: Text;
    content: Text;
    date: Text;
  };

  stable var nextPostId: Nat = 0;
  stable var posts: [Post] = [];

  public func createPost(title: Text, content: Text, date: Text): async Result.Result<Nat, Text> {
    let post: Post = {
      id = nextPostId;
      title = title;
      content = content;
      date = date;
    };
    posts := Array.append([post], posts);
    nextPostId += 1;
    #ok(post.id)
  };

  public query func getPosts(): async [Post] {
    posts
  };

  public query func getPost(id: Nat): async ?Post {
    Array.find(posts, func(post: Post): Bool { post.id == id })
  };
}
