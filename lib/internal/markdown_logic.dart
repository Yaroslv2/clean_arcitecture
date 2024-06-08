String modifyMarkdown({required String markdown}) {
  return markdown.split("\n").join("  \n");
}