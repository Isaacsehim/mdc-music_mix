1 - SELECT COUNT(*) FROM titre;

2 - SELECT *, COUNT(playlist.p_id) FROM playlist
INNER JOIN utilisateurs_has_playlist ON playlist.p_id = utilisateurs_has_playlist.p_id
INNER JOIN utilisateurs ON utilisateurs_has_playlist.u_id = utilisateurs.u_id
GROUP BY utilisateurs.u_nom
ORDER BY `utilisateurs`.`u_nom` ASC

3 - SELECT utilisateurs.u_nom, playlist.p_nom, GROUP_CONCAT(titre.t_nom)
FROM playlist
INNER JOIN utilisateurs_has_playlist ON playlist.p_id = utilisateurs_has_playlist.p_id INNER JOIN utilisateurs ON utilisateurs_has_playlist.u_id = utilisateurs.u_id INNER JOIN playlist_has_titre ON playlist.p_id = playlist_has_titre.p_id INNER JOIN titre ON playlist_has_titre.t_id = titre.t_id 
GROUP BY p_nom
ORDER BY `utilisateurs`.`u_nom` ASC

4 - SELECT genre.g_nom, GROUP_CONCAT(titre.t_nom)
FROM titre
INNER JOIN genre_has_titre ON titre.t_id = genre_has_titre.t_id
INNER JOIN genre ON genre_has_titre.g_id = genre.g_id
GROUP BY t_nom
ORDER BY `genre`.`g_nom` ASC

5 - SELECT titre.t_nom, COUNT(playlist_has_titre.t_id) AS nombre_utilisation
FROM playlist_has_titre
INNER JOIN titre ON playlist_has_titre.t_id = titre.t_id
GROUP BY titre.t_nom
ORDER BY nombre_utilisation DESC;