SRCS		=	file_processing/file_processing.c	\
				file_processing/file_processing2.c	\
				file_processing/fp_colors.c			\
				file_processing/fp_map.c			\
				file_processing/fp_map2.c			\
				file_processing/fp_resolution.c		\
				file_processing/fp_sprite.c			\
				file_processing/fp_walls.c			\
				close.c								\
				detect_wall.c						\
				detect_wall2.c						\
				draw_aerial.c						\
				drawing.c							\
				drawing2.c							\
				errors.c							\
				init_cub3d.c						\
				main.c								\
				mathematics.c						\
				move.c								\
				save.c								\
				sprite.c							\
				get_next_line/get_next_line.c		\
				get_next_line/get_next_line_utils.c
INCLUDES	=	-Iget_next_line						\
				-Ilibftprintf						\
				-Iminilibx-linux					\
				-Iincludes
OBJS		=	${SRCS:.c=.o}
CC			=	clang
FLAGS		=	-Wall -Werror -Wextra ${INCLUDES} -D BUFFER_SIZE=4096
LIBS		=	-lXext -lbsd -lmlx -lX11 -lm -O3
NAME		=	cub3d
RM			=	rm -f

.c.o :
			${CC} -c $< -o ${<:.c=.o} ${FLAGS}

$(NAME) :	${OBJS}
			make -C minilibx-linux -f Makefile
			make -C libftprintf -f Makefile
			${CC} ${OBJS} ${FLAGS} ${LIBS} -L. libftprintf/libftprintf.a \
			minilibx-linux/libmlx.a minilibx-linux/libmlx_Linux.a -g -o ${NAME}

all :		${NAME}

bonus :		all

clean :
			make clean -C libftprintf -f Makefile
			make clean -C minilibx-linux -f Makefile
			${RM} ${OBJS}

fclean :	clean
			make fclean -C libftprintf -f Makefile
			${RM} ${NAME}

re:			fclean all

.PHONY:		all fclean clean re