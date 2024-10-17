
# DAY 29 - Challenge 29

# FULL-TEXT SEARCH CAPABILITIES IN MySQL

USE Next;

CREATE TABLE articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    content TEXT,
    category VARCHAR(100),
    FULLTEXT(title, content)
);

INSERT INTO articles (title, content, category) 
VALUES 
('Introduction to Web Development', 'Web development involves building websites and applications...', 'Technology'),
('The Impact of AI on Society', 'Artificial Intelligence is transforming industries and human life...', 'Science'),
('How to Improve Your Programming Skills', 'Programming is a skill that requires continuous learning and practice...', 'Education'),
('AI and Machine Learning Explained', 'Machine Learning is a subset of AI that allows machines to learn from data...', 'Science'),
('Top 10 Tips for Data Analysis', 'Data analysis is a critical skill in today’s business world...', 'Business'),
('Full-Text Search in MySQL', 'Full-text search is a powerful feature in MySQL...', 'Technology'),
('Best Practices for Writing Clean Code', 'Clean code is essential for maintaining software over time...', 'Education'),
('Natural Language Search in Databases', 'Natural language search attempts to interpret human language in queries...', 'Technology'),
('Understanding Boolean Search in MySQL', 'Boolean search allows the use of operators like AND, OR, NOT...', 'Technology');

SELECT * FROM articles;

# 1. Find all articles related to 'MySQL'.

SELECT id,title FROM articles
WHERE MATCH(title,content) AGAINST('MySQL');

# 2. Search for articles that contain both 'data' and 'analysis'.

SELECT id,title FROM articles
WHERE MATCH(title,content) 
AGAINST('+data +analysis' IN BOOLEAN MODE);

# 3. Find articles with high relevance to 'clean code' and 'programming'.

SELECT id,title,
MATCH(title,content) AGAINST('clean code programming')
AS relevance
FROM articles
ORDER BY relevance DESC;