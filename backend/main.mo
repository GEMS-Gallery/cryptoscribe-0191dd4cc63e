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
    body: Text;
    author: Text;
    timestamp: Int;
  };

  stable var nextPostId: Nat = 0;
  stable var posts: [(Nat, Post)] = [];

  public func createPost(title: Text, body: Text, author: Text): async Result.Result<Nat, Text> {
    let post: Post = {
      id = nextPostId;
      title = title;
      body = body;
      author = author;
      timestamp = Time.now();
    };
    posts := Array.append([(nextPostId, post)], posts);
    nextPostId += 1;
    #ok(post.id)
  };

  public query func getPosts(): async [Post] {
    Array.map(posts, func((_, post): (Nat, Post)): Post { post })
  };

  public query func getPost(id: Nat): async ?Post {
    let result = Array.find(posts, func((postId, _): (Nat, Post)): Bool { postId == id });
    switch (result) {
      case (null) { null };
      case (?(_, post)) { ?post };
    }
  };
}
