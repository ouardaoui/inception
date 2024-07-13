all :
	mkdir -p /tmp/dali3/db /tmp/dali3/wp
	docker-compose -f srcs/docker-compose.yml up -d --build

clean :
	rm -rf /tmp/dali3/db /tmp/dali3/wp
	docker-compose -f srcs/docker-compose.yml down
	echo y | docker buildx prune

fclean : clean
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force


re : fclean all
