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
    title: Text;
    date: Text;
    content: Text;
  };

  stable var posts: [Post] = [
    {
      title = "The Art of Social Engineering";
      date = "2024-09-10";
      content = "Social engineering remains one of the most effective hacking techniques. This post explores the psychology behind successful social engineering attacks and how to protect yourself and your organization from falling victim to these sophisticated manipulations.";
    },
    {
      title = "Exploring the Dark Web: Risks and Precautions";
      date = "2024-09-08";
      content = "The dark web is often misunderstood and sensationalized. In this post, we'll demystify the dark web, discuss its legitimate uses, and outline the precautions you should take if you decide to explore this hidden part of the internet.";
    },
    {
      title = "Ethical Hacking: Protecting Systems by Breaking Them";
      date = "2024-09-05";
      content = "Ethical hacking plays a crucial role in cybersecurity. We'll delve into the world of white hat hackers, exploring their methodologies, tools, and the vital role they play in securing systems and networks against malicious attacks.";
    }
  ];

  public query func getPosts(): async [Post] {
    posts
  };

  public func addPost(newPost: Post): async () {
    posts := Array.append([newPost], posts);
  };
}
