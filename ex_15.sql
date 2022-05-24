/*
15. Напишите запрос, который показывает все треки, но не отображает их идентификаторы. На выходе в первой колонке должно быть название трека, 
во второй название альбома, в третье медиа-тип, в четвертой жанр трека.
*/
SELECT t.name,
       a.title,
       m.name,
       g.name
FROM   track t
       JOIN album a
         ON t.albumid = a.albumid
       JOIN mediatype m
         ON t.mediatypeid = m.mediatypeid
       JOIN genre g
         ON t.genreid = g.genreid;
       