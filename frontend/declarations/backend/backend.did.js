export const idlFactory = ({ IDL }) => {
  const Post = IDL.Record({
    'title' : IDL.Text,
    'content' : IDL.Text,
    'date' : IDL.Text,
  });
  return IDL.Service({
    'addPost' : IDL.Func([Post], [], []),
    'getPosts' : IDL.Func([], [IDL.Vec(Post)], ['query']),
  });
};
export const init = ({ IDL }) => { return []; };
