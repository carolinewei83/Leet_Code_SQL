
-- 1517. Find Users With Valid E-Mails
-- A valid e-mail has a prefix name and a domain where:
-- The prefix name is a string that may contain letters (upper or lower case), digits, underscore '_', period '.', and/or dash '-'.
-- The prefix name must start with a letter.
-- The domain is '@leetcode.com'.

-- Regular expression documentation:
-- https://dev.mysql.com/doc/refman/8.0/en/regexp.html#function_regexp-substr

SELECT
  *
FROM
  Users
WHERE
  mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode[.]com$';
