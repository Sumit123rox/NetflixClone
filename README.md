# netflix_clone

# Core Features 🎬

#### 1. Curated Sections
* Popular Movies Carousel : Horizontal swipeable slider showcasing trending films.
* Now Playing/Upcoming : Horizontal scroll lists for current releases and coming soon movies.
* New & Hot Section : Highlighting upcoming releases with dynamic updates.
#### 2. Movie Details
* Full-screen details view with:
* Synopsis, cast, ratings
"Similar Movies" recommendations based on TMDB data 
#### 3. Search & Discovery
* Search movies by title with auto-suggestions 8
* Filter by categories (popular/upcoming)

## Technical Implementation 🛠

#### Carousel Slider :
* Built with carousel_slider package for smooth horizontal scrolling.
#### Horizontal Lists :
* Implemented using ListView.builder with horizontal axis
#### TMDB Integration :
* Fetches data from:
`/movie/popular`
`/movie/now_playing`
`/movie/upcoming`
`/movie/{id}/similar` endpoints
