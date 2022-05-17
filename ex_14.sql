/*14. Напишите запрос, который показывает общее количество треков в каждом Playlist.
 На выходе в первой колонке должно быть количество треков, во второй название плейлиста.*/
SELECT Count(t.trackid),
       p.name
FROM   track t
       JOIN playlisttrack pt
         ON pt.trackid = t.trackid
       JOIN playlist p
         ON p.playlistid = pt.playlistid
GROUP  BY p.name;