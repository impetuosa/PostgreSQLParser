tests
testSelect56
	self
		parse: 'SELECT personne.cle AS clepersonne, civilite.civilite AS sexe, personne.nom AS nompersonne, personne.prenom AS prenompersonne, personne.datenaissance, grade.grade AS corps, chemin_photo((personne.photo)::text) AS photo, personne.uid, personne.mailperso, personne.telephoneperso, (SELECT agt_genere_liste_avec_br((equipe.nom)::text) AS agt_genere_liste_avec_br FROM support, affectation, equipe WHERE ((((support.cle_personne = personne.cle) AND (affectation.cle_support = support.cle)) AND (affectation.cle_equipe = equipe.cle)) AND ((affectation.debut <= now()) AND ((affectation.fin >= now()) OR (affectation.fin IS NULL))))) AS nomequipes, (SELECT agt_genere_liste_avec_br(vue_annuaire_localisations_par_membre.emplacement) AS agt_genere_liste_avec_br FROM vue_annuaire_localisations_par_membre WHERE (vue_annuaire_localisations_par_membre.clepersonne = personne.cle)) AS localisations FROM civilite, (((support LEFT JOIN personne ON ((support.cle_personne = personne.cle))) LEFT JOIN grade ON ((support.cle_grade = grade.cle))) LEFT JOIN affectation ON ((affectation.cle_support = support.cle))) WHERE ((personne.civilite = civilite.cle) AND ((support.debut <= now()) AND ((support.fin >= now()) OR (support.fin IS NULL)))) GROUP BY personne.cle, civilite.civilite, personne.prenom, personne.nom, personne.datenaissance, grade.grade, personne.photo, personne.uid ORDER BY personne.nom, personne.prenom' rule: #selectCommand