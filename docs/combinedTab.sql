CREATE VIEW combinedTab as 
SELECT tab.*, issue.name as issue, fakebook.name as fakebook, magazine.name as magazine
FROM mytab.tab 
LEFT JOIN issue ON tab.idIssue = issue.idIssue 
LEFT JOIN fakebook ON tab.idFakebook = fakebook.idFakebook
LEFT JOIN magazine ON issue.Magazine_idMagazine = magazine.idMagazine;