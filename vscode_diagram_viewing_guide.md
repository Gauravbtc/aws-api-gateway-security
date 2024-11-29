# Viewing Diagrams in VS Code and Using Application Composer

## Viewing Mermaid Diagrams in VS Code

To view the Mermaid diagram in the cloud_diagram.md file:

1. Install the "Markdown Preview Mermaid Support" extension in VS Code:
   - Open VS Code Extensions (Ctrl+Shift+X)
   - Search for "Markdown Preview Mermaid Support"
   - Click Install

2. Open cloud_diagram.md
3. Click the "Open Preview" button in the top-right corner (or press Ctrl+Shift+V)
4. The Mermaid diagram will be rendered in the preview

## AWS Application Composer

AWS Application Composer is a separate tool from VS Code. To use AWS Application Composer:

1. Visit the AWS Management Console
2. Search for "AWS Application Composer"
3. Use the visual designer to create and modify your cloud architecture

Note: AWS Application Composer is a separate service from VS Code's Mermaid diagram viewing capability. If you want to create or modify cloud architecture diagrams:
- Use Mermaid for simple documentation diagrams in markdown
- Use AWS Application Composer for creating actual AWS infrastructure with a visual interface that can generate CloudFormation/SAM templates