CREATE TABLE nodes (
  node_id   INT PRIMARY KEY,
  parent_id INT NULL,
  INDEX idx_nodes_parent_id (parent_id)
);

INSERT INTO nodes (node_id, parent_id) VALUES
  (1,  NULL),
  (2,  1),
  (3,  2),
  (4,  1),
  (5,  4),
  (6,  4),
  (7,  6),
  (8,  NULL),
  (9,  8),
  (10, 8),
  (11, 10),
  (12, 10);

SELECT 
    node_id,
    parent_id,
    CASE 
    WHEN parent_id IS NULL THEN 'ROOT'
    WHEN NOT EXISTS (
      SELECT 1
      FROM nodes n2
      WHERE n1.node_id=n2.parent_id
    ) THEN 'Leaf'
ELSE 'INTERNAL'
END AS node_type
FROM nodes n1;