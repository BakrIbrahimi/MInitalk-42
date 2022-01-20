/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bibrahim <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/01/20 16:14:25 by bibrahim          #+#    #+#             */
/*   Updated: 2022/01/20 16:14:41 by bibrahim         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include"minitalk.h"

void	sms(int signum)
{
	if (signum == SIGUSR2)
	{
		ft_putstr("<<<< 3LA SLAMTEK >>>>\n");
	}
}

void	ft_binary(int PID, char *str)
{
	int	bit;
	int	i;

	bit = 0;
	i = 0;
	while (1)
	{
		while (bit < 9)
		{
			if (str[i] & (128 >> bit))
				kill(PID, SIGUSR1);
			else
				kill(PID, SIGUSR2);
			bit++;
			usleep(300);
			if (bit == 8)
			{
				bit = 0;
				break ;
			}
		}
		if (!str[i])
			break ;
		i++;
	}
}

int	main(int ac, char **av)
{
	int	pid;

	if (ac != 3 || av[2][0] == '\0')
	{
		ft_putstr("error\n");
		exit (1);
	}
	pid = ft_atoi(av[1]);
	signal(SIGUSR2, sms);
	if (pid == -1)
	{
		ft_putstr("error\n");
		exit(1);
	}
	ft_binary(pid, av[2]);
}
