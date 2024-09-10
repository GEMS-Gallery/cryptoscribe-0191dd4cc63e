import React, { useState } from 'react';
import { TextField, Button, Box } from '@mui/material';
import { Editor } from 'react-draft-wysiwyg';
import { EditorState, convertToRaw } from 'draft-js';
import draftToHtml from 'draftjs-to-html';
import 'react-draft-wysiwyg/dist/react-draft-wysiwyg.css';

interface NewPostFormProps {
  onSubmit: (title: string, body: string, author: string) => void;
  onCancel: () => void;
}

const NewPostForm: React.FC<NewPostFormProps> = ({ onSubmit, onCancel }) => {
  const [title, setTitle] = useState('');
  const [author, setAuthor] = useState('');
  const [editorState, setEditorState] = useState(EditorState.createEmpty());

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    const body = draftToHtml(convertToRaw(editorState.getCurrentContent()));
    onSubmit(title, body, author);
  };

  return (
    <Box component="form" onSubmit={handleSubmit} sx={{ display: 'flex', flexDirection: 'column', gap: 2 }}>
      <TextField
        label="Title"
        value={title}
        onChange={(e) => setTitle(e.target.value)}
        required
        fullWidth
      />
      <TextField
        label="Author"
        value={author}
        onChange={(e) => setAuthor(e.target.value)}
        required
        fullWidth
      />
      <Box sx={{ border: 1, borderColor: 'grey.300', borderRadius: 1, p: 1 }}>
        <Editor
          editorState={editorState}
          onEditorStateChange={setEditorState}
          wrapperClassName="wrapper-class"
          editorClassName="editor-class"
          toolbarClassName="toolbar-class"
        />
      </Box>
      <Box sx={{ display: 'flex', justifyContent: 'flex-end', gap: 2 }}>
        <Button type="button" onClick={onCancel}>Cancel</Button>
        <Button type="submit" variant="contained">Submit</Button>
      </Box>
    </Box>
  );
};

export default NewPostForm;
