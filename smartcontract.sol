pragma solidity ^0.8.9;

contract CopyrightTracker {
    struct Artwork {
        string title;
        string artist;
        string metadata;
        bool registered;
    }

    mapping(uint256 => Artwork) public artworks;
    uint256 public artworkCount;

    // Register an artwork
    function registerArtwork(string memory _title, string memory _artist, string memory _metadata) public {
        artworkCount++;
        artworks[artworkCount] = Artwork(_title, _artist, _metadata, true);
    }

    // Get artwork details by ID
    function getArtwork(uint256 _id) public view returns (string memory, string memory, string memory, bool) {
        require(_id > 0 && _id <= artworkCount, "Artwork does not exist");
        Artwork memory art = artworks[_id];
        return (art.title, art.artist, art.metadata, art.registered);
    }

    // Get the total number of registered artworks
    function getArtworkCount() public view returns (uint256) {
        return artworkCount;
    }
}

