tests
testSelect8
	self
		parse: 'SELECT localisation.cle_personne AS clepersonne, ((((((((((((''<a href="''::text || (genere_url_carto(localisation.cle_batiment, localisation.bureau))::text) || ''" target="_blank">''::text) || (site.nom)::text) || ''<br>''::text) || (batiment.nom)::text) || ''<br>''::text) || (affiche_etage(localisation.etage))::text) || ''Bureau ''::text) || (localisation.bureau)::text) || ''</a><br>''::text) || (localisation.telephone)::text) || ''<br>''::text) AS emplacement FROM localisation, site, batiment WHERE (((localisation.visible = true) AND (localisation.cle_batiment = batiment.cle)) AND (batiment.cle_site = site.cle))' rule: #selectCommand