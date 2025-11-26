#include "SDL3/SDL.h"
#include <stdbool.h>
#include <assert.h>

int main(void)
{
    assert(SDL_Init(SDL_INIT_VIDEO));
    SDL_Window *window = SDL_CreateWindow("SDL3 Window", 800, 600, 0);
    assert(window);
    SDL_Renderer *renderer = SDL_CreateRenderer(window, NULL);
    assert(renderer);
    
    bool running = true;
    SDL_Event event;


    while (running)
    {
        while (SDL_PollEvent(&event))
        {
            if (event.type == SDL_EVENT_QUIT)
            {
                running = false;
            }
        }

        SDL_SetRenderDrawColor(renderer, 50, 100, 200, 255);
        SDL_RenderClear(renderer);
        SDL_RenderPresent(renderer);
    }

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();
    return 0;
}